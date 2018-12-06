const ViewElements = (() => {

    const newElement = (type) => {
      return document.createElement(type);
    }

    const addAttributes = (element, attributes) => {
      if (element !== "" || attributes !== undefined) {
        Object.keys(attributes).forEach(function(key) {
          element.setAttribute(key,attributes[key]);
        });
        return element;
      }
      return null;
    }

    const addClass = (element, classes) => {
      element.classList = classes;
    }

    const getElement = (element) => {
      return document.querySelector(element);
    }

    const setContent = (element, value) => {
      element.textContent = value;
      return element;
    }

    const attachEvent = (element, type, behavior) => {
      element.addEventListener(type, behavior);
    }

    const applyStyles = (element, styles) => {

      if (styles != undefined) {
        Object.keys(styles).forEach(function(styleName){
          element.style.cssText += styleName+styles[styleName];
        });
      }
    }

    return {
      newElement, addAttributes, getElement, setContent,
      addClass, attachEvent, applyStyles
    }

})();

export {ViewElements}
