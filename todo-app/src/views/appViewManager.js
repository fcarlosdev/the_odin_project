import {ItemList} from "../views/itemList.js";

const ManagerView = (() => {

  let todosList;

  const addNewTodoToListOfTodos = (todoName) => {
    todosList = document.querySelector(".lst-todos");
    todosList.appendChild(ItemList.newListItem(todoName, nextItemListId()));
  }

  const nextItemListId = () => {
    return (todosList.children.length + 1);
  }

  return { addNewTodoToListOfTodos }

})()

export { ManagerView };
