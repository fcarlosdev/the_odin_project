import DOMElement from '../lib/dom-elem';

const DOMButton = ((type, label) => {

  const create = () => {
    if (type === 'Button') {
      //TODO Create a button element
      return DOMElement('button').setContent(label).element;
    } else if (type === 'Span') {
      //TODO Create a span clickable
      return DOMElement('span').setContent(label).element;
    }
  };

  return {
    create,
  };

});

export default DOMButton;
