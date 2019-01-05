import DOMElement from "../libs/dom-element-lib";

const TaskHeader = (() => {

  const create = (id, name) => {
    return createContent([createTitle(name), createShowDetails()],id)
  }

  const showTaskDetails = (e) => {

    let taskDetails = getTaskDetailsEl(e.target);

    if (e.target.textContent == "Show details") {
      taskDetails.style.display = "flex";
      taskDetails.style.flexDirection = "column";
      e.target.textContent = "Hide details";
    } else {
      taskDetails.style.display = "none";
      e.target.textContent = "Show details";
    }
    
  }

  const getTaskDetailsEl = fromTarget => {
    return fromTarget.parentElement
                     .parentElement
                     .querySelector('.task-details');
  }

  const createTitle = withContent => {
    return DOMElement("h2").setContent(withContent).element;
  }

  const createShowDetails = () => {
    return DOMElement("a").setContent("Show details")
                          .addAttributes({"href": "#"})
                          .attachEvent("click",showTaskDetails)
                          .element;
  }

  const createContent = (withChildren, withTaskId) => {
    return DOMElement("div").addAttributes({'id':"task"+withTaskId})
                            .addClasses(["task-title"])
                            .addChildren(withChildren)
                            .element;
  }


  return {create}

})();

export {TaskHeader}
