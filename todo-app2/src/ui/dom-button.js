import DOMElement from '../lib/dom-elem';

const DOMButton = ((type, label) => {

  const create = (eventType, eventMethod, classes) => {
    let buttonType = (type === 'Button') ? 'button' : 'span';
    return DOMElement(defineBtType(type)).setContent(label)
                                         .addClasses(classes)
                                         .attachEvent(eventType, eventMethod)
                                         .element;
  };

  const defineBtType = fromType =>
    (fromType === 'Button') ? 'button' : 'span';

  return {
    create,
  };

});

export default DOMButton;
