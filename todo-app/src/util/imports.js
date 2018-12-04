const importCssFiles = () => {
  let req = require.context("../css", false, /\.css$/);
  req.keys().forEach(function(key){
    req(key);
  });
}

export { importFiles };
