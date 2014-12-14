package PhotoHosting;
use Mojo::Base 'Mojolicious';

use Mango;

sub startup {
	my $self = shift;

	# Config
	my $config = $self->app->plugin('JSONConfig' => {file => 'config.json'});

	# Log level
	$self->app->log->level('debug');

	# Secrets
	$self->app->secrets([
		'ixtY06xLRDzunyDhUhzil1BvwymPP1',
		'oT58sQ974wsc1vAxki7A6TaEX2XRy0',
		'eWHOZvPlfF0jPHM1TJ93DjuPhlN2JI'
	]);

	# Mongodb users
	$self->helper(users => sub {
		state $mango = Mango->new('mongodb://' . $config->{db}->{host} . ':' . $config->{db}->{port} );
		return $mango->db($config->{db}->{name})->collection('users');
	});

	# Mongodb reports
	$self->helper(reports => sub {
		state $mango = Mango->new('mongodb://' . $config->{db}->{host} . ':' . $config->{db}->{port} );
		return $mango->db($config->{db}->{name})->collection('reports');
	});

	# Routes
	my $r = $self->routes;

	# Главная страница
	$r->get('/')->to(template => 'index')->name('mainPage');
	# Регистрация
	$r->post('/register')->to('user#register')->name('userRegister');
	# Вход
	$r->post('/login')->to('user#login')->name('userLogin');
	# Выход
	$r->get('/logout')->to('user#logout')->name('userLogout');

	# Проверка сессии
	my $profile = $r->under('/profile')->to('user#auth');
	# Страница пользователя
	$profile->get('/')->to(template => 'profile')->name('userProfile');
	# Добавить альбом
	$profile->post('/album/add')->to('album#add')->name('addAlbum');
	# Просмотр альбома
	$profile->get('/album/:index' => [index => qr/(0|[1-9]\d*)/])->to('album#view')->name('viewAlbum');
	# Добавить изображение
	$profile->post('/album/:index/add' => [index => qr/(0|[1-9]\d*)/])->to('album#addImage')->name('addImage');

	# Публичный просмотр альбома
	$r->get('/:id' => [id => qr/[a-f0-9]{32}/])->to('album#publicView')->name('publicViewAlbum');
	# Пожаловаться администратору
	$r->get('/:id/report' => [id => qr/[a-f0-9]{32}/])->to('album#report')->name('reportAlbum');
}

1;