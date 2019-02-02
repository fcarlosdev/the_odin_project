const DOMElement = (type) => ({

  element: document.createElement(type),

  setContent(value) {
    if (value !== undefined && text !== null)
      this.element.appendChild(document.createTextNode(value));
    return this;
  },

  addClasses(classes) {
    if (classes !== undefined && classes.length !== 0)
      this.element.classList.add(classes);
    return this;
  },

  addAttributes(attributes) {
    if (attributes !== unedfined && attributes.length !== 0) {
      for (let key in attributes) {
        this.element.setAttribute(key, attributes[key]);
      }
    }

    return this;
  },

  addChildren(children) {
    if (children !== undefined && children.length !== 0) {
      children.forEach(child => {
        this.element.appendChild(child);
      });
    }

    return this;
  },

  attachEvent(event, eventBody) {
    this.element.addEventListener(event, eventBody);
    return this;
  },

  applyStyles(...styles) {
    if (styles != undefined)
      this.element.setAttribute('style', styles);
    return this;
  },

});

export default DOMElement;
