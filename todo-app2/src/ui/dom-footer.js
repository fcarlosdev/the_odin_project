import DOMElement from '../lib/dom-elem';
import DOMTaskList from  '../ui/dom-task-list';
import DOMSearch from '../lib/dom-search-elem';
import Util from '../util/utility.js';

const DOMFooter = (() => {

  const createProjectFooter = project =>
    DOMElement('div').addClasses('project-footer')
                            .addChildren([
                              createTaskLink(project, 'Task name'),
                            ]).element;

  const createTaskLink = (project, taskName) =>
    DOMElement('span').setContent('+ Add task')
                      .addClasses('newtask')
                      .attachEvent('click', () => addTaskTo(project, taskName))
                      .element;

  const addTaskTo = (project, name) => {
    DOMTaskList().addTask(project, name);
    Util().setProjectHeight(project);
  };

  return {
    createProjectFooter,
  };

});

export default DOMFooter;
