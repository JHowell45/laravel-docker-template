VERSION=$1
echo "Version number passed: $VERSION"

curl -L https://github.com/laravel/laravel/archive/v$VERSION.tar.gz | tar xz
mv laravel-$VERSION src