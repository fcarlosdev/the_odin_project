const ViewManager = ((appView) => {

  const createElement = (type, value="") => {
    let element = appView.createElement(type);
    if (value !== "") {
      element.textContent = value;
    }
    return element;
  }

  const createTodo = (todoList, todoName) => {
      let todoItem             = document.createElement("li");
      let spanTdName           = document.createElement("span");
      let spanTdSymbol         = document.createElement("span");
      spanTdName.textContent   = todo.getName();
      spanTdSymbol.textContent = "x";
      todoItem.appendChild(spanTdName);
      todoItem.appendChild(spanTdSymbol);
      todosList.appendChild(todoItem);
  }

})();

export { ViewManager }
