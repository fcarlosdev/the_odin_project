import {Todo} from "./models/todo";
import ElementFactory from './elements/dom-element-lib';

const TodoApp = () => {

  let todoModel;

  const createTodoModel = (todoName) => {
    todoModel = Todo(todoName);
  }

  const newTodoDomElement = (params) => {
    createTodoModel(params.textNode);
    let el = ElementFactory(params.type).setContent(params.textNode)
                                        .addClasses(params.classes)
                                        .addAttributes(params.attributes);
    return el.element;
  }

  const getTodoModel = () => {
    return todoModel;
  }

  return { newTodoDomElement, getTodoModel }
}

export {TodoApp};
