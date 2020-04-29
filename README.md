# laravel-docker-template

Laravel Docker template that is running behind Nginx.

- [laravel-docker-template](#laravel-docker-template)
  - [tl;dr](#tldr)
  - [Application Blueprint](#application-blueprint)
  - [Instructions](#instructions)

## tl;dr

You can run the application using `docker-compose up` or through an application like DockStation. The application can be found running on `127.0.0.1:8080`.

## Application Blueprint

This application uses the following technologies:

- MySQL
- Redis
- Nginx
- Laravel (6.18.8).

All of the following applications are hooked up together within Docker compose file and the Laravel app `.env.example` has been updated to point to the correct host named in the docker compose file, you simply need to create your own `.env` using the example as a base.

## Instructions

- To start, the project comes with a default laravel base project version 6.18.8. If you are unhappy with that version this project comes with a script `get_base_project.sh` you can run this and pass the version number as the param to get the specific version you want.

- Next you'll want to install the Laravel packages. This can by done by running `cd src` and running either `composer_install.sh` or `composer_install_win.sh` depending on which system you're running this on. It'll install the Laravel packages and you should see a local `vendor` directory in your `src` directory.

- Next you need to run `docker-compose build` to create the docker images based from the Dockerfiles created for Nginx and the Laravel app.

- To run the project you simply need to run `docker-compose up -d` the `-d` param makes sure it's running in the background so it doesn't take up your terminal. I've tried running it in "Dockstation", however ended up having issues running the next few commands for the project, it's better to just use the terminal, YMMV.

- Next there are a few commands that need to be run to generate keys and migrate the database. For this purpose I've provided two scripts for running the php commands, they are `phpd.sh` and `phpd_win.sh` they basically run `docker-compose exec app php $@` with the win prefacing it with `winpty`. Theses commands make it much easier to run the necessary commands.

- The commands that are needed to be run are `<base_script> artisan key:generate` and `<base_script> artisan optimise` for generating a key and optimisng the app and `<base_script> artisan migrate --seed` for running the database migrations. You need to replace the `<base_script>` with `phpd.sh` or `phpd_win.sh` depending on the system.

- With this done you should be finally setup and ready to run your Laravel application. :)
