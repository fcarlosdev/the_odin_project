const importCssFiles = () => {
  let req = require.context("../css", false, /\.css$/);
  req.keys().forEach(function(key){
    req(key);
  });
}

// const importImagesFiles = () => {
//   let req = require.context("../images", false, /\.(png|svg|jpg|gif|jpeg)$/);
//   req.keys().forEach(function(key){
//     req(key);
//   });
// }

export { importFiles };
