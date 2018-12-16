const TaskHeader = (() => {

  const create = (id, name) => {

    let title = document.createElement("h2");
    title.textContent = name;

    let showDetails         = document.createElement("a");
    showDetails.setAttribute("href","#");
    showDetails.textContent = "Show details";
    showDetails.addEventListener("click",showTaskDetails);

    let content = document.createElement("div");
    content.setAttribute("id","task"+id);
    content.classList.add("task-title");
    content.appendChild(title);
    content.appendChild(showDetails);

    return content;
  }

  const showTaskDetails = (e) => {
    let taskDetails = e.target.parentElement.parentElement
                                            .querySelector('.task-details');
    if (e.target.textContent == "Show details") {
      taskDetails.style.display = "flex";
      taskDetails.style.flexDirection = "column";
      e.target.textContent = "Hide details";
    } else {
      taskDetails.style.display = "none";
      e.target.textContent = "Show details";
    }
  }

  return {create}

})();

export {TaskHeader}
