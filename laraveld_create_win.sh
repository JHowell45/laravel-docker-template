docker run --rm --interactive --volume $(cmd //c cd):/app composer create-project --prefer-dist laravel/laravel $@
cp scripts/* $@
