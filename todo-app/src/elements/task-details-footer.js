import {AuxiliarLib} from "../util/auxiliar-lib.js";
import DOMElement from "../libs/dom-element-lib";

const TaskDetailsFooter = (() => {

  const create = (task,removeTaskImpl) => {

    let taskDoneWrapper   = createDoneWrapper([createCheckboxDone(task), createLabelDone(task)]);                                               
    let removeTaskWrapper = createRemoveTaskWrapper([createRmoveTextElem(task,removeTaskImpl)]);

    return DOMElement("div").addClasses(["task-details-footer"])
                            .addChildren([taskDoneWrapper, removeTaskWrapper])
                            .element;
  }

  const taskDone = (event) => {      
      let task = document.getElementById("task"+event.target.getAttribute("id"));      
      if (event.target.checked) {
        task.style.color = "#fff";
        task.querySelector("h2").style.textDecoration = "line-through";
      } else {
        task.querySelector("h2").style.textDecoration = "none";
      }
  }

  const createLabelDone = (forTask) => {
    return DOMElement("label").setContent("Done")
                              .addAttributes({for: forTask.getId()})
                              .element;
  }

  const createCheckboxDone = (forTask) => {
    let withAttributes = {id: forTask.getId(), type: "checkbox", value: "done"};
    return DOMElement("input").attachEvent("click",taskDone)
                              .addAttributes(withAttributes)
                              .element;
  }

  const createDoneWrapper = (withChidren) => {
    return DOMElement("div").addClasses(["task-done"])
                            .addChildren(withChidren)
                            .element;
  }

  const createRmoveTextElem = (forTask,eventImpl) => {
    return DOMElement("span").setContent("Remove")
                            //  .attachEvent("click",removeTask.bind(null,forTask))
                             .attachEvent("click",eventImpl)
                             .element;
  }

  const createRemoveTaskWrapper = (withChildren) => {
    return DOMElement("div").addClasses(["bt-remove"])
                            .addChildren(withChildren)
                            .element;
  }

  return {create}

})();

export {TaskDetailsFooter}
