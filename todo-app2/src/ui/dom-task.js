import DOMElement from '../lib/dom-elem';
import Util from '../util/utility.js';

const DOMTask = ((id, task) => {

  const createTask = () => {

    let btDetails = createButton('Details', 'lk-details',
                                  event => showDetails(event));
    let btRemove = createButton('Remove', 'lk-remove', event => removeTask(event));

    let taskHeader = createTaskHeader(
      [createTaskTitle(task.getTitle()), createTaskHeaderButtons([btDetails, btRemove])]
    );

    let taskContent = createTaskBody(task.getDescription());

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

  const createButton = (label, classes, method) =>
    DOMElement('span').setContent(label)
                      .addClasses(classes)
                      .attachEvent('click', method)
                      .element;

  const createTaskHeaderButtons = buttons =>
    DOMElement('div').addClasses('t-header-buttons')
                     .addChildren(buttons)
                     .element;

  const createTaskTitle = title => DOMElement('h4').setContent(title).element;

  const createTaskHeader = content =>
    DOMElement('div').addClasses('task-header')
                     .addChildren(content)
                     .element;

  const createTaskBody = description =>
    DOMElement('div').setContent(description)
                     .addClasses('task-content')
                     .element;

  const createTaskFooter = () => {

    return DOMElement('div').addClasses('task-footer')
                            .addChildren([createDueDateEL(), createPriorityEL(), createDoneEL()])
                            .element;
  };

  const createDueDateEL = () => {

    let dueDateLabel = DOMElement('span').setContent('Due date: ')
                                         .addClasses('l-bold').element;

    return DOMElement('span').addClasses('due-date')
                             .addChildren([dueDateLabel])
                             .setContent(task.getDueDate())
                             .element;
  };

  const createPriorityEL = () => {
    let priorityLabel = DOMElement('span').setContent('Priority: ')
                                          .addClasses('l-bold')
                                          .element;

    return DOMElement('span').addClasses('priority')
                             .addChildren([priorityLabel])
                             .setContent(task.getPriority())
                             .element;
  };

  const createDoneEL = () => {
    let chkDone = DOMElement('input').addAttributes({ type: 'checkbox' })
                                     .addClasses('task-done')
                                     .element;

    return DOMElement('span').addChildren([chkDone])
                             .setContent(' Done')
                             .element;

  }

  const showDetails = event => {
      let details = event.target;
      let task    = event.target.parentElement.parentElement.parentElement;
      let project = task.parentElement.parentElement;

      task.style.height = (task.style.height == '150px') ? '38px' : '150px';
      details.textContent = (details.textContent == 'Details') ? 'Hide' : 'Details';
      task.children[1].style.display = (details.textContent == 'Details') ? 'none' : 'flex';
      task.children[2].style.display = (details.textContent == 'Details') ? 'none' : 'flex';

      if (details.textContent === 'Hide') {
        project.style.height = 'auto';
        project.style.display = 'flex';
      } else {
        project.style.display = 'block';
        Util().setProjectHeight(project);
      }

    };

  const removeTask = event => {
      let task    = event.target.parentElement.parentElement.parentElement;
      let tasks   = task.parentElement;
      let project = tasks.parentElement;
      let h = project.style.height;
      tasks.removeChild(task);
      Util().setProjectHeight(project);

    };

  return {
      createTask,
    };

});

export default DOMTask;
