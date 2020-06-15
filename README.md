# laravel-docker-template

Laravel Docker template that is running behind Nginx.

- [laravel-docker-template](#laravel-docker-template) - [tl;dr](#tldr) - [Application Blueprint](#application-blueprint) - [Instructions](#instructions) - [Troubleshooting](#troubleshooting) - [Can't run the migrations?](#cant-run-the-migrations) - [TODO](#todo)

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

- To start, you need to create a laravel project. This can be done by either running the script `get_base_project.sh` and pass the version number as the param to grab the gibhub specific version you want or defaulting to version `6.18.8`. This will always create an output directory called `src`. The other script is for you to run the `laraveld_create.sh` or `laraveld_create_win.sh` to create an update to date project using the composer command. You need to pass the name for the project you want to create if you plan to use the second command, this will name the project to whatever you want it to be called.

- Next you'll want to install the Laravel packages. This can by done by running `cd src` and running either `./composerd.sh install` or `./composerd_win.sh install` depending on which system you're running this on. It'll install the Laravel packages and you should see a local `vendor` directory in your `src` directory.

- Next you need to run `docker-compose build` to create the docker images based from the Dockerfiles created for Nginx and the Laravel app.

- Next, it's important to setup the `.env` file for the Laravel application, without it many of the scripts won't work along with the application itself. You should be able to copy the `.env.example` verbatim into a created `.env` file and it should work.

- To run the project you simply need to run `docker-compose up -d` the `-d` param makes sure it's running in the background so it doesn't take up your terminal. I've tried running it in "Dockstation", however ended up having issues running the next few commands for the project, it's better to just use the terminal, YMMV.

- Next there are a few commands that need to be run to generate keys and migrate the database. For this purpose I've provided two scripts for running the php commands, they are `phpd.sh` and `phpd_win.sh` they basically run `docker-compose exec app php $@` with the win prefacing it with `winpty`. Theses commands make it much easier to run the necessary commands.

- The commands that are needed to be run are `<base_script> artisan key:generate` and `<base_script> artisan optimise` for generating a key and optimisng the app and `<base_script> artisan migrate --seed` for running the database migrations. You need to replace the `<base_script>` with `phpd.sh` or `phpd_win.sh` depending on the system.

- With this done you should be finally setup and ready to run your Laravel application. :)

## Troubleshooting

This section is for addressing issues the I ended up having a problems with.

### Can't run the migrations?

I had an issue where I kept seeing the following error message:

```
$ ./phpd_win.sh artisan migrate --seed

   Illuminate\Database\QueryException  : SQLSTATE[HY000] [1045] Access denied for user 'root'@'172.26.0.2' (using password: NO) (SQL:

  at /var/www/vendor/laravel/framework/src/Illuminate/Database/Connection.php:669
    665|         // If an exception occurs when attempting to run a query, we'll format the error
    666|         // message to include the bindings with SQL, which will make this exception a
    667|         // lot more helpful to the developer instead of just the database's errors.
    668|         catch (Exception $e) {
  > 669|             throw new QueryException(
    670|                 $query, $this->prepareBindings($bindings), $e
    671|             );
    672|         }
    673|

  Exception trace:

  1   PDOException::("SQLSTATE[HY000] [1045] Access denied for user 'root'@'172.26.0.2' (using password: NO)")
      /var/www/vendor/laravel/framework/src/Illuminate/Database/Connectors/Connector.php:70

  2   PDO::__construct("mysql:host=database;port=3306;dbname=laravel", "root", "", [])
      /var/www/vendor/laravel/framework/src/Illuminate/Database/Connectors/Connector.php:70

  Please use the argument -v to see more details.
```

First thing, make sure that the `DB_USERNAME` and the `DB_PASSWORD` environment variables are wrapped in `"` quotes in the `.env` file. You then may have to run `./phpd_win.sh artisan config:clear` and `./phpd_win.sh artisan cache:clear` to clear the applications environment variables and reset them to the new ones set. Then when you run the migration command it should work.

## TODO

- Fix the NPM commands to be able to be run using a docker container.
