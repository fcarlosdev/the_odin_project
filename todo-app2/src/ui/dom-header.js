import DOMElement from '../lib/dom-elem';

// import DOMButton from './ui/dom-button';

const DOMHeader = ((toDomEl, withTitle, withClasses) => {

  const createHeader = () =>
    DOMElement('div').addClasses(withClasses)
                     .addChildren([
                       createTitleElement(withTitle),
                       createButton('Remove', toDomEl),
                      ]).element;

  const createTitleElement = withTitle =>
    DOMElement('h3').setContent(withTitle).element;

  const createButton = (type, domEl) =>
    DOMElement('span').setContent(setButtonIcon(type))
                      .addClasses('remove-project')
                      .attachEvent('click', () => setButtonAction(type, domEl))
                      .element;

  const setButtonAction = (type, param) => {
    if (type === 'Remove') remove(param);
  };

  const setButtonIcon = typeButton => {
    if (typeButton === 'Remove') return 'x';
  };

  const remove = domEl => domEl.parentElement.removeChild(domEl);

  return {
    createHeader,
  };

});

export default DOMHeader;
