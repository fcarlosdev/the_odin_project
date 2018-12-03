const elementUtil = (app) => {

  let element;

  const create = (type, value) => {
    element = document.createElement(type);
    element.textContent = value;
    return element;
  }

  const applyAttributesTo = (element, attributes) => {

    if (attributes != null) {
      const attributesKeys = Object.keys(attributes);
      if (attributesKeys.length > 0) {
        attributesKeys.forEach(function(key) {
          element.setAttribute(key, attributes[key]);
        });
      }
    }
    return element;
  }


  const applyClassesTo = (element, classes) => {

    if (classes != null && classes.length > 0) {
      classes.forEach(function(className) {
        element.classList.add(className);
      });
    }
    return element;
  }

  const applyStylesTo = (element, styles) => {
    if (styles != null) {
      Object.keys(styles).forEach(function(styleName){
        element.style.cssText += styleName+styles[styleName];
      })
    }
    return element;
  };


  return {
    create, applyAttributesTo, applyClassesTo,
    applyStylesTo
  };
};

export { elementUtil };
