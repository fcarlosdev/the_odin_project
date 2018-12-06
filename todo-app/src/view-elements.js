const ViewElements = (() => {

    const newElement = (type) => {
      return document.createElement(type);
    }

    const addAttribute = (element, attributes) => {
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
      document.addEventListener(type, behavior);
    }

    return {
      newElement, addAttribute, getElement, setContent,
      addClass, attachEvent
    }

})();

export {ViewElements}
