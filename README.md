
## Run those commands
- docker-compose up -d --build
- docker-compose run --rm composer install
- docker-compose run --rm artisan key:generate
İle laravel kurulacak:
- docker-compose run --rm composer create-project laravel/laravel .
Ardından .env dosyası içeriği düzenlenecek.