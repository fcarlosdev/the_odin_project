
const elementFactory = (type) => ({

    element: document.createElement(type),

    setContent(text) {
        if (text !== undefined && text !== null)
            this.element.appendChild(document.createTextNode(text));
        return this;
    },

    addClasses(classes) {
        if (classes !== undefined && classes.length !== 0)
            this.element.classList.add(classes);
        return this;
    },

    addAttributes(attributes) {
        if (attributes !== undefined && attributes.length !== 0) {
            for(let key in attributes) {
                this.element.setAttribute(key,attributes[key]);
            }
        }
        return this;
    },

    addChildren(children) {
        if (children !== undefined && children.length !== 0) {
            children.forEach(child => {
                this.element.appendChild(child);
            })
        }
        return this;
    },

    attachEvent(event, eventBody) {
        this.element.addEventListener(event, eventBody);
        return this;
    },

    applyStyles(...styles) {
      if (styles != undefined) {
        this.element.setAttribute("style",styles);
      }
      return this;
    }

});

export default elementFactory;
