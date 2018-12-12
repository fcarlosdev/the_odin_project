const AuxiliarLib = (() => {

  const removeChildNodesFrom = (parent) => {
      while(parent.hasChildNodes()) {
        parent.removeChild(parent.lastChild);
      }
  }

  return { removeChildNodesFrom }

})();

export { AuxiliarLib }
