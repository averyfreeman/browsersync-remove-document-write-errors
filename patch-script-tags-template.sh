#!/usr/bin/env bash
# ./patch-script-tags-template.sh
# by Avery Freeman
# https://github.com/averyfreeman
#
################################################################
# Reference browser-sync github issue: 
# https://github.com/BrowserSync/browser-sync/issues/1600
################################################################
# set -v

echo 'copy the patch to the browser-sync/templates directory'
cp script-tags.patch ../node_modules/browser-sync/templates/.

echo 'change to the templates directory'
cd ../node_modules/browser-sync/templates

echo 'show the unpatched file'
cat script-tags.tmpl

echo 'apply the patch'
patch -bst < script-tags.patch

echo 'show the newly patched file'
cat script-tags.tmpl

echo 'now document.write error should be gone from devTools'

echo 'if you want to revert the change, run:'
echo 'patch -R < script-tags.patch'

echo 'all done!'