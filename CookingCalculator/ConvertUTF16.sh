UTF8="text/plain; charset=utf-8"
LANGS=$(find ./GOAT/*.lproj/Localizable.strings)

mkdir ./GOAT/temp
for LANG in $LANGS
do
CURRENT_TYPE=$(file -bI $LANG)
if [ "$CURRENT_TYPE" != "$UTF8" ]; then
iconv -f UTF-16 -t UTF-8 $LANG > ./GOAT/temp/Localizable.strings
mv ./GOAT/temp/Localizable.strings $LANG
fi
done
rm -r ./GOAT/temp

