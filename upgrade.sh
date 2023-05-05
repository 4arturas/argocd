#!/bin/bash

# exit when any command fails
set -e

new_ver=$1

echo "new version: $new_ver"

# Simulate release of the new docker images
docker tag nginx:1.23.4 arturix/nginx:$new_ver

# Push new version to dockerhub
docker push arturix/nginx:$new_ver

# Create temporary folder
tmp_dir=$(mktemp -d)
echo $tmp_dir

# Clone GitHub repo
git clone git@github.com:4arturas/argocd.git $tmp_dir

cd $tmp_dir

# Update image tag
sed -i -e "s/arturix\/nginx:.*/arturix\/nginx:$new_ver/g" $tmp_dir/my-app/1-deployment.yaml
#sed -i 's/Hello/Howdy/g' welcome.txt

# Commit and push
git add .
git commit -m "Update image to $new_ver"
git push

# Optionally on build agents - remove folder
rm -rf $tmp_dir