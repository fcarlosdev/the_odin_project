const importImages = (from) => {
  let req = require.context("../images", false, /\.(png|svg|jpg|gif|jpeg)$/);
  req.keys().forEach(function(key){
      req(key);
  });
  return req;
}

export { importImages }
