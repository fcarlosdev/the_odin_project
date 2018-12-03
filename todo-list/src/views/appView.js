import {elementUtil} from '../util/util.js';

const ElementFactory = (app) => {

  const Element = elementUtil();

  const newElement = (type, value, attributes, classes, styles) => {
    let element = Element.create(type,value);
    if (attributes != null) {
      Element.applyAttributesTo(element,attributes);
    }

    if (classes != null) {
      Element.applyClassesTo(element,classes);
    }

    if (styles != null) {
      Element.applyStylesTo(element,styles);
    }

    return element;
  }

  return { newElement };
}

export { ElementFactory };
