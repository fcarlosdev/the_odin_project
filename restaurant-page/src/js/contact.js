import * as UTILITY from '../js/util.js';

const loadPage = (mainContent)  => {

  const h1Contact = UTILITY.newComplexElement("h1");
  h1Contact.setValue("Contact Us");

  const spanCoastView = UTILITY.newComplexElement("span");
  spanCoastView.setValue("Direct Way Mall");

  const spanStreet = UTILITY.newComplexElement("span");
  spanStreet.setValue("Ocean View, 234");

  const spanFoneNumber = UTILITY.newComplexElement("span");
  spanFoneNumber.setValue("Fone: 1234 - 3456");

  const divLocation = UTILITY.newComplexElement("div");
  divLocation.applyStyles(["location"]);

  divLocation.getElement().appendChild(spanCoastView.getElement());
  divLocation.getElement().appendChild(spanStreet.getElement());
  divLocation.getElement().appendChild(spanFoneNumber.getElement());

  const divContactSection = UTILITY.newComplexElement("div");
  divContactSection.applyStyles(["section-title"]);

  divContactSection.getElement().appendChild(h1Contact.getElement());
  divContactSection.getElement().appendChild(divLocation.getElement());

  const contactPage = UTILITY.newComplexElement("section");
  contactPage.applyAttributes({"id": "sec-contatc"});
  contactPage.applyStyles(["headline"]);

  contactPage.getElement().appendChild(divContactSection.getElement());

  mainContent.appendChild(contactPage.getElement());

  return mainContent;

}

export { loadPage };
