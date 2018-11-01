const newElement = (type, value,attributes, classes) => {
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

export { newElement };
