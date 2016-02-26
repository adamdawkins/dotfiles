function mantra_module() {
  mkdir -p $1/actions/tests;
  touch $1/actions/index.js;
  mkdir -p $1/components/tests;
  mkdir -p $1/configs/method_stubs;
  touch $1/configs/method_stubs/index.js;
  mkdir -p $1/containers/tests;
  touch $1/index.js;
  touch $1/routes.jsx;
}
