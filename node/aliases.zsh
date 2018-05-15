alias scripts='jq .scripts package.json'
# removes node modules from all folders in this directory
alias trash_node_modules='find . -maxdepth 2 -name "node_modules" -exec rm -rf '{}' \;'
