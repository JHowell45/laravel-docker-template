# laravel-docker-template

Laravel Docker template that is running behind Nginx.

- [laravel-docker-template](#laravel-docker-template)
  - [tl;dr:](#tldr)
  - [Application Blueprint:](#application-blueprint)
  - [Setting up:](#setting-up)

## tl;dr:

You can run the application using `docker-compose up` or through an application like DockStation. The application can be found running on `127.0.0.1:8080`.

## Application Blueprint:

This application uses the following technologies:

- MySQL
- Redis
- Nginx
- a base Laravel 6 project taken from the laravel github.

All of the following applications are hooked up together within Docker and the Laravel app .env has been updated to point to the correct host named in the docker compose file.

## Setting up:

To start you'll need to run of either of the `composer_install` scripts within this project or you can run `composer install` locally on your machine if you have php and composer installed, though this application is setup so you don't have to do that.

Once the `vendor` directory has been created you simply run `docker-compose up` in the terminal or you can run the Docker application using something like Dockstation to run the `docker-compose` file, this will boot up the application and the additional resources.
