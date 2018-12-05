const ItemList = (() => {

  const itemList = document.createElement("li");

  const newListItem = (content,idItem) => {
    itemList.setAttribute("id",idItem);
    return setListItemContent(itemList,content);
  }

  const setListItemContent = (item, content) => {
    item.textContent = content;
    return item;
  }

  return {newListItem}

})();

export {ItemList}
