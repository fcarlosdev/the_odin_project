
const elementFactory = (type) => ({

    element: document.createElement(type),
    
    setContent(text) {
        this.element.appendChild(document.createTextNode(text));
        return this;
    },

    addClasses(...classes) {
        this.element.classList.add(classes);
        return this;
    },

    addAttributes(attributes) {    
        
        for(let key in attributes) {
            this.element.setAttribute(key,attributes[key]);            
        }
        return this;
    },

    addChildren(...children) {
        children.forEach(child => {
            this.element.appendChild(child);
        })        
        return this;
    },

    attachEvent(event, eventBody) {
        this.element.addEventListener(event, eventBody);
        return this;
    }

});

export default elementFactory;