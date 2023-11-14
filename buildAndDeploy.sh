stack build
stack exec site build

COMMIT=$(git log -1 --pretty=%B)
git checkout master
cp -r _site/* .
git add .
git commit -m $COMMIT

echo "git add and commit \"$COMMIT\""
git checkout develop