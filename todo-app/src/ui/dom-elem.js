const DOMElement = (type) => ({

  element: document.createElement(type),

  setContent(value) {
    if (value !== undefined && value !== null)
      this.element.appendChild(document.createTextNode(value));
    return this;
  },

  addClasses(classes) {
    if (classes !== undefined && classes.length !== 0)
      classes.forEach(classe => this.element.classList.add(classe)) 
    return this;
  },

  addAttributes(attributes) {
    if (attributes !== undefined && attributes.length !== 0) {
      for (let key in attributes) {
        this.element.setAttribute(key, attributes[key]);
      }
    }

    return this;
  },

  addChildren(children) {
    if (children !== undefined && children.length !== 0) {
      children.forEach(child => {
        if( child !== undefined)
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
