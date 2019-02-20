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

  const getChildren = (element,level) => {
    
    if ( notNull(element) ) {
      return (level != undefined) ? element.children[level] : element.children;
    }
    return [];

  }

  const getGrandSon = (fromElement, grandSonaWanted) => {
    if (notNull(fromElement)) {
      return (grandSonaWanted !== undefined) ? fromElement.querySelector(grandSonaWanted) : null;
    }  
    return null;
  }

  const notNull = element => (element !== undefined && element !== null);

  return {
    getGrandParentElement, getElement, getChildren, getGrandSon
  };

};

export default DOMSearch;
