const DOMSearch = () => {

  const getGrandParentElement = (selector, level) => {
      let parentWanted = null;

      if (notNull(selector)) {

        for (let i = 0; i < level; i++) {
          if (parentWanted === null) {
            parentWanted = selector.parentElement;
          } else {
            parentWanted = parentWanted.parentElement;
          }
        }
      }

      return parentWanted;

    };

  const getElement = selector =>
    notNull(selector) ? document.querySelector(selector) : null;

  const getChildren = element =>
    notNull(element) ? element.children : [];

  const notNull = element => (element !== undefined && element !== null);

  return {
    getGrandParentElement, getElement, getChildren,
  };

};

export default DOMSearch;
