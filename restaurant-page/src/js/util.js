const newSimpleElement = (type, value,attributes, classes) => {
  const element = document.createElement(type);
  element.textContent = value;

  if (attributes != null) {
    const attributesKeys = Object.keys(attributes);
    if (attributesKeys.length > 0) {
      attributesKeys.forEach(function(key) {
        element.setAttribute(key, attributes[key]);
      });
    }
  }

  if (classes != null && classes.length > 0) {
    classes.forEach(function(className) {
      element.classList.add(className);
    });
  }

  return element;
};


const newComplexElement = (pgElement) => {

  let element = document.createElement(pgElement);

  const setValue = (value) => {
    element.textContent = value;
  }

  const applyAttributes = (attributes) => {
    const attributesKeys = Object.keys(attributes);
    if (attributesKeys.length > 0) {
      attributesKeys.forEach(function(key) {
        element.setAttribute(key, attributes[key]);
      });
    }
  };

 const applyStyles = (styles) => {
   if (styles != null && styles.length > 0) {
     styles.forEach(function(style) {
       element.classList.add(style);
     });
   }
   return parent;
 };

 const addChild = (child) => {
   element.appendChild(child);
 }

 const getElement = () => { return element };

  return {applyAttributes, applyStyles, addChild, getElement, setValue}
};

export { newSimpleElement, newComplexElement };
