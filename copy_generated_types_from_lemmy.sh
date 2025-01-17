#!/bin/bash

# Remove the old bindings
pushd ../lemmy/crates
rm -rf **/bindings
popd

# First re-generate the types by running cargo test on lemmy
pushd ../lemmy/scripts
./test.sh

cd ../crates

# Copy them over to the types folder
cp api_common/bindings/* ../../lemmy-js-client/src/types/
cp db_schema/bindings/* ../../lemmy-js-client/src/types/
cp db_views/bindings/* ../../lemmy-js-client/src/types/
cp db_views_actor/bindings/* ../../lemmy-js-client/src/types/
cp db_views_moderator/bindings/* ../../lemmy-js-client/src/types/
cp utils/bindings/* ../../lemmy-js-client/src/types/

popd

# Remove the Sensitive type
rm src/types/Sensitive.ts

# Change all the bigints to numbers
find src/types -type f -name '*.ts' -exec sed -i 's/bigint/\/* integer *\/ number/g' {} +

node putTypesInIndex.js

prettier -w src/types src/index.ts

