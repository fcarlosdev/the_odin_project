import DOMElement from '../lib/dom-elem';
import DOMButton from '../ui/dom-button';

const DOMHeader = ((toDomEl, withTitle, withClasses) => {

  const createHeader = () =>
    DOMElement('div').addClasses(withClasses)
                     .addChildren([
                       createTitleElement(withTitle),
                       createDelButtonTo(toDomEl)
                      ]).element;

  const createTitleElement = withTitle =>
    DOMElement('h3').setContent(withTitle).element;

  const createDelButtonTo = AppliedToDomEl =>
    DOMButton('Span','x').create('click', () => setButtonAction('Remove', toDomEl),'remove-project');

  const setButtonAction = (type, param) => {
    if (type === 'Remove') remove(param);
  };

  const remove = domEl => domEl.parentElement.removeChild(domEl);

  return {
    createHeader,
  };

});

export default DOMHeader;
