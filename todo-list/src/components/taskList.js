const tasks = (app) => {

  const showTasks = (todo) => {

    let taskList             = app.createElement('ul');
    taskList.style.listStyle = 'none';
    taskList.style.margin    = '0';
    taskList.style.padding   = '0';
    taskList.style.display   = 'flex';
    taskList.style.justifyContent = "space-between";

    todo.getTasks().forEach(function(task) {

        let taskItem    = app.createElement('li');
        let checkCircle = app.createElement('img');
        checkCircle.src = 'images/circle-regular.svg';
        checkCircle.setAttribute('status','not-done');
        checkCircle.classList.add('img');

        let taskItemDesc = app.createElement('li');
        let taskItemDate = app.createElement('li');
        let taskItemPriority = app.createElement('li');

        checkCircle.addEventListener('click', function() {

          if (checkCircle.getAttribute('status') === 'not-done') {
            checkCircle.src = 'images/circle-solid.svg'
            checkCircle.setAttribute('status','done');
          } else {
            checkCircle.src = 'images/circle-regular.svg';
            checkCircle.setAttribute('status','not-done');
          }
        });

        taskItem.appendChild(checkCircle);
        taskItem.append(task.getTitle());
        taskItemDesc.append(task.getDescription());
        taskItemDate.append(task.getDueDate());
        taskItemPriority.append(task.getPriority());
        taskList.appendChild(taskItem);
        taskList.appendChild(taskItemDesc);
        taskList.appendChild(taskItemDate);
        taskList.appendChild(taskItemPriority);
    });
    // todoTasks.appendChild(taskList);
    return taskList
  }

  return { showTasks }

}

export { tasks };
