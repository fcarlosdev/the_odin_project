const AuxiliarLib = (() => {

  const removeChildNodesFrom = (parent) => {
      while(parent.hasChildNodes()) {
        parent.removeChild(parent.lastChild);
      }
  }

  const removeNodeElement = (element) => {
    if (element != undefined) {
      element.parentElement.removeChild(element);
    }
  }

  return { removeChildNodesFrom, removeNodeElement }

})();

export { AuxiliarLib }
