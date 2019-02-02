import DOMElement from '../lib/dom-elem';

const DOMTask = (() => {

  const createButton = (label, classes, method) =>
    DOMElement('span').setContent(label)
                      .addClasses(classes)
                      .attachEvent('click', method)
                      .element;

  const createTaskHeaderButtons = buttons =>

    DOMElement('div').addClasses('t-header-buttons')
                     .addChildren(buttons)
                     .element;

  const createTaskTitle = title =>
    DOMElement('h4').setContent(title).element;

  const createTaskHeader = content =>
    DOMElement('div').addClasses('task-header')
                     .addChildren(content)
                     .element;

  const createTaskBody = description =>
    DOMElement('div').setContent(description)
                     .addClasses('task-content')
                     .element;

  const createTaskFooter = () => {

    let dueDateLabel = DOMElement('span').setContent('Due date:')
                                         .addClasses('l-bold')
                                         .element;

    let dueDate = DOMElement('span').addClasses('due-date')
                                    .setContent(' 31/01/2019')
                                    .addChildren([dueDateLabel])
                                    .element;

    let priorityLabel = DOMElement('span').setContent('Priority')
                                          .addClasses('l-bold')
                                          .element;

    let priority = DOMElement('span').setContent('Low')
                                     .addClasses('priority')
                                     .addChildren([priorityLabel])
                                     .element;

    let chkDone = DOMElement('input').addAttributes({ type: 'checkbox' })
                                     .addClasses('task-done')
                                     .element;

    let spDone = DOMElement('span').addChildren([chkDone])
                                   .setContent(' Done')
                                   .element;

    return DOMElement('div').addClasses('task-footer')
                            .addChildren([dueDate, priority, spDone])
                            .element;
  };

  const createTask = (id, name) => {

    let btDetails = createButton('Details', 'lk-details',
                                  event => showDetails(event));
    let btRemove = createButton('Remove', 'lk-remove', event => removeTask(event));

    let taskHeader = createTaskHeader(
      [createTaskTitle(name), createTaskHeaderButtons([btDetails, btRemove])]
    );

    let taskContent = createTaskBody('This is a model of a task');

    let taskFooter = createTaskFooter();

    let newTask = DOMElement('div').addClasses('task-item')
                                   .addAttributes({ id: 'task' + id })
                                   .addChildren([
                                      taskHeader, taskContent, taskFooter,
                                   ])
                                   .element;

    newTask.style.marginBottom = '10px';
    return newTask;

  };

  const showDetails = event => {
      let lkDetails = event.target;
      let task      = event.target.parentElement.parentElement.parentElement;
      let project   = task.parentElement.parentElement;

      task.style.height = (task.style.height == '150px') ? '38px' : '150px';
      details.textContent = (details.textContent == 'Details') ? 'Hide' : 'Details';
      task.children[1].style.display = (details.textContent == 'Details') ? 'none' : 'flex';
      task.children[2].style.display = (details.textContent == 'Details') ? 'none' : 'flex';

      project.style.height = 'auto';
      project.style.display = 'flex';

    };

  const removeTask = event => {
      let task    = event.target.parentElement.parentElement.parentElement;
      let tasks   = task.parentElement;
      let project = tasks.parentElement;
      let h = project.style.height;
      tasks.removeChild(task);
      if (tasks.children.length < 5) {
        let nH = Number(h.substring(0, h.length - 2)) - 48;
        project.style.height = nH.toString().concat('px');
      }

    };

  return {
      createTask,
    };

});

export default DOMTask;
