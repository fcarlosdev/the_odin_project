import DOMElement from '../lib/dom-elem';
import DOMTaskList from  '../ui/dom-task-list';
import DOMSearch from '../lib/dom-search-elem';

const DOMFooter = (() => {

  const createProjectFooter = () =>

    DOMElement('div').addClasses('project-footer')
                            .addChildren([
                              createTaskLink('Task name'),
                            ]).element;

  const createTaskLink = (taskName) =>
    DOMElement('span').setContent('+ Add task')
                      .addClasses('newtask')
                      .attachEvent('click', (event) => addTask(event, taskName))
                      .element;

  const addTask = (event, name) => {
    let project = DOMSearch().getGrandParentElement(event.target, 2);
    DOMTaskList().addTask(project, name);
    setProjectHeight(project);
  };

  const setProjectHeight = project => {

    let finalHeight = 80;
    for (let h = 0; h < project.children[1].children.length; h++) {
      finalHeight += 48;
    }

    if (finalHeight < 282) {
      project.style.height = finalHeight + 'px';
    } else {
      project.style.height = '320px';
    }

  };

  return {
    createProjectFooter,
  };

});

export default DOMFooter;
