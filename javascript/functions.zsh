function cleanup_node_modules () {
  find . -maxdepth 2 -name "node_modules" -exec rm -rf '{}' \;
}
