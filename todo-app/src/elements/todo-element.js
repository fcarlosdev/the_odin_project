import {TaskForm} from "./task-form.js";
import {DomElement} from "./dom-element.js";
import {AuxiliarLib} from "../util/auxiliar-lib.js";
import {Todo} from "../models/todo.js";
import {ListOfTask} from "./list-of-tasks.js";

const TodoElement = (() => {

  let todoElement;
  let todoSection;
  let todoModel;

  const createTodoElement = (elementType, content) => {
    todoModel = Todo(content);
    return todoElement = attachSelectEvent(createTodo(elementType, content));
  }

  const attachSelectEvent = (todoDomElem) => {
    DomElement.attachEvent(todoDomElem, "click", e => {
      AuxiliarLib.removeChildNodesFrom(DomElement.getElement(".todo-title"));
      AuxiliarLib.removeChildNodesFrom(DomElement.getElement("#tasks"));
      ListOfTask.showListTo(todoModel);
      todoSection = creatTodoSection();
      DomElement.addChildrenTo(todoSection,[createTodoSectionIdentification(),
                                 attachNewTodoTaskEvent(createButtonAddTask())]);
    });
    return todoDomElem;
  }

  const attachNewTodoTaskEvent = (btAddTask) => {
    DomElement.attachEvent(btAddTask, "click", e => {
      TaskForm.addTaskTo(todoModel);
    });
    return btAddTask;
  }

  const createTodo = (tagType, content) => {
    return DomElement.addAttributes(
            DomElement.newElement(tagType,content),{"id": content}
          );
  }

  const creatTodoSection = () => {
    return DomElement.applyStyles(
            DomElement.getElement(".todo-title"),{"display:":"flex"}
           );
  }

  const createButtonAddTask = () => {
    return DomElement.addClass(
             DomElement.newElement("div","Add Task"),["add-task"]
           );
  }

  const createLinkRemoveTodo = () => {
    return DomElement.addClass(
             DomElement.newElement("div","Remove"), ["bt-remove"]
           );
  }

  const attachRemoveTodoEvent = (toElement) => {
    DomElement.attachEvent(toElement, "click", e => {
      AuxiliarLib.removeChildNodesFrom(DomElement.getElement(".todo-title"));
      AuxiliarLib.removeNodeElement(todoElement);
      AuxiliarLib.removeNodeElement(DomElement.getElement("#tasks"));
      DomElement.applyStyles(todoSection, {"display:":"none"});
    });
    return toElement;
  }

  const createTodoSectionIdentification = () => {
    return DomElement.addChildrenTo(
             DomElement.addAttributes(
               DomElement.addClass(DomElement.newElement("div"),["todo-actions"]),
               {"id":"todo-section"}
             ),[DomElement.newElement("h1",todoElement.textContent),
                attachRemoveTodoEvent(createLinkRemoveTodo(),todoElement)]
           );
  }

  const listTaskOf = (todo) => {
    if (todo.getTasks().length > 0) {

    }
  }

  return { createTodoElement }

})();

export { TodoElement }
