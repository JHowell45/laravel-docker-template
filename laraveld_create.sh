docker run --rm --interactive --volume $(pwd):/app composer create-project --prefer-dist laravel/laravel $@
cp scripts/* $@
