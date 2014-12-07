package PhotoHosting::Controller::User;
use Mojo::Base 'Mojolicious::Controller';

use Data::Dumper;

# Регистрация
sub register {
	my $self = shift;
	my $post = $self->req->body_params;
	my $login = $post->param('login') // '';
	my $password = $post->param('password') // '';
	# LOG
	$self->app->log->info("REGISTER L ${login} P ${password}");
	# Валидация
	my $errorMessage = '';
	$errorMessage = 'Не указан пароль' unless ($password || $password eq '0');
	$errorMessage = 'Не указан логин' unless ($login || $login eq '0');
	if ($errorMessage) {
		$self->flash(registerError => $errorMessage);
		return $self->redirect_to('mainPage');
	}
	# Проверяем существование и добавляем
	$self->delay(
		sub {
			my $delay = shift;
			$self->users->find_one(
				{
					name => $login
				},
				$delay->begin
			);
		},
		sub {
			my ($delay, $error, $user) = @_;
			return $self->redirect_to('userProfile') if $error;
			if (defined $user) {
				$self->flash(registerError => 'Пользователь уже существует');
				$self->redirect_to('mainPage');
			} else {
				$self->users->insert(
					{
						name => $login,
						password => $password,
						albums => []
					},
					$delay->begin
				);
			}
		},
		sub {
			my ($delay, $error, $oid) = @_;
			return $self->reply->exception if $error;
			$self->session(login => $login);
			$self->redirect_to('userProfile');
		}
	);
}

# Вход
sub login {
	my $self = shift;
	my $post = $self->req->body_params;
	my $login = $post->param('login') // '';
	my $password = $post->param('password') // '';
	# LOG
	$self->app->log->info("LOGIN L ${login} P ${password}");
	# Валидация
	my $errorMessage = '';
	$errorMessage = 'Не указан пароль' unless ($password || $password eq '0');
	$errorMessage = 'Не указан логин' unless ($login || $login eq '0');
	if ($errorMessage) {
		$self->flash(loginError => $errorMessage);
		return $self->redirect_to('mainPage');
	}
	# Извлекаем пользователя из БД
	$self->render_later;
	$self->users->find_one(
		{
			name => $login
		},
		sub {
			my ($collection, $error, $user) = @_;
			return $self->reply->exception if $error;
			if ((defined $user) && ($user->{password} eq $password)) {
				$self->session(login => $login);
				$self->redirect_to('userProfile');
			} else {
				$self->flash(loginError => 'Неверно указан логин или пароль');
				$self->redirect_to('mainPage');	
			}
		}
	);
}

# Выход
sub logout {
	my $self = shift;
	$self->session(expires => 1);
	$self->redirect_to('mainPage');
}

# Проверка сессии
sub auth {
	my $self = shift;
	my $login = $self->session('login') // '';
	unless ($login || $login eq '0') {
		$self->redirect_to('mainPage');
		return undef;
	}
	# $self->render_later;
	$self->users->find_one(
		{
			name => $login
		},
		sub {
			my ($collection, $error, $user) = @_;
			return $self->reply->exception if $error;
			if (defined $user) {
				$self->stash(albums => $user->{albums});
				$self->continue;
			} else {
				$self->redirect_to('mainPage');
			}
		}
	);
	return undef;
}

1;