const DOMSearch = (selector) => {

  const queryElement = selector =>
    checkNull(selector) ? ocument.querySelector(selector) : null;

  const queryElementChildren = element =>
    checkNull(element) ? element.children : [];

  const checkNull = element => (element !== undefined && element !== null);

};

export default DOMSearch;
