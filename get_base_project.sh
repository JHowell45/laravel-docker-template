
if [ -z "$1" ]
  then
    VERSION=6.18.8
  else
    VERSION=$1
fi
echo "Version number passed: $VERSION"

curl -L https://github.com/laravel/laravel/archive/v$VERSION.tar.gz | tar xz
mv laravel-$VERSION src

cp scripts/* src