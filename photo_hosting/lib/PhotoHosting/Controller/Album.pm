package PhotoHosting::Controller::Album;
use Mojo::Base 'Mojolicious::Controller';

use Image::ExifTool qw(:Public);
use Digest::MD5 qw(md5_hex);
use Data::Dumper;

# Добавить альбом
sub add {
	my $self = shift;
	my $login = $self->session('login');
	my $post = $self->req->body_params;
	my $name = $post->param('name') // '';
	# LOG
	$self->app->log->info("ADD_ALBUM N ${name}");
	# Валидация
	unless ($name || $name eq '0') {
		$self->flash(addAlbumError => 'Не указано название');
		return $self->redirect_to('userProfile');
	}
	# Добавление альбома в базу
	$self->render_later;
	$self->users->update(
		{
			name => $login,
		},
		{
			'$push' => {
				albums => {
					id => md5_hex(join'',map{chr int rand 256}(1..50)),
					name => $name,
					images => [],
					author => $login,
					report => 0
				}
			}
		},
		sub {
			my ($collection, $error, $user) = @_;
			$self->reply->exception if $error;
			$self->redirect_to('userProfile');
		}
	);
}

# Просмотр альбома
sub view {
	my $self = shift;
	my $login = $self->session('login');
	my $index = $self->stash('index');
	#
	my @albums = @{ $self->stash('albums') };
	if ($index > $#albums) {
		$self->reply->not_found;
	} else {
		$self->render('profile');
	}
}

# Добавить изображение
sub addImage {
	my $self = shift;
	my $login = $self->session('login');
	my $index = $self->stash('index');
	my $image = $self->req->upload('image');
	my @albums = @{ $self->stash('albums') };
	# Валидация
	if ($index > $#albums) {
		return $self->reply->not_found;
	}
	unless (defined $image) {
		$self->flash(uploadError => 'Не указан файл');
		return $self->redirect_to('viewAlbum', index => $index);
	}
	if ($image->size > 1024 * 1024) {
		$self->flash(uploadError => 'Слишком большой файл (> 1MB)');
		return $self->redirect_to('viewAlbum', index => $index);
	}
	unless ($image->headers->content_type eq 'image/jpeg') {
		$self->flash(uploadError => 'Только .jpeg');
		return $self->redirect_to('viewAlbum', index => $index);
	}
	my $bytes = $image->slurp;
	my $info = ImageInfo(\$bytes);
	if ($info->{Error} || $info->{MIMEType} ne 'image/jpeg') {
		$self->flash(uploadError => 'Только .jpeg');
		return $self->redirect_to('viewAlbum', index => $index);
	}
	# Сохранение изображения
	my $randomName = md5_hex(join'',map{chr int rand 256}(1..50));
	$image->move_to($self->app->home . '/public/images/' . $randomName . '.jpg');
	# Добавление изображения в базу
	my $comment = substr($info->{Description} || 'без описания', 0, 12);
	$self->render_later;
	$self->users->update(
		{
			name => $login
		},
		{
			'$push' => {
				"albums.${index}.images" => {
					name => $randomName,
					comment => $comment
				}
			}
		},
		sub {
			my ($collection, $error, $user) = @_;
			$self->reply->exception if $error;
			$self->redirect_to('viewAlbum', index => $index);
		}
	);
}

# Публичный просмотр альбома
sub publicView {
	my $self = shift;
	my $id = $self->stash('id');
	# Поиск альбома
	$self->render_later;
	$self->users->find_one(
		{
			'albums.id' => $id
		},
		{
			'albums.$' => 1
		},
		sub {
			my ($collection, $error, $user) = @_;
			return $self->reply->exception if $error;
			my $album = $user->{albums}->[0];
			return $self->reply->not_found unless $album;
			$self->render('public', album => $album);
		}
	);
}

sub report {
	my $self = shift;
	my $id = $self->stash('id');
	# Поиск и изменение альбома
	$self->render_later;
	$self->reports->insert(
		{
			id => $id,
			report => 1
		},
		sub {
			my ($collection, $error, $user) = @_;
			return $self->reply->exception if $error;
			$self->flash(report => 1);
			$self->redirect_to('publicViewAlbum', id => $id);
		}
	);
}

1;