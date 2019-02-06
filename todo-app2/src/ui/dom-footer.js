import DOMElement from '../lib/dom-elem';
import DOMTaskList from  '../ui/dom-task-list';
import DOMSearch from '../lib/dom-search-elem';
import DOMButton from '../ui/dom-button';
import Util from '../util/utility.js';

import DOMFormTask from '../ui/dom-task-form';

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
    // DOMTaskList().addTask(project, name);
    // Util().setProjectHeight(project);
    DOMFormTask().show();
  };

  return {
    createProjectFooter,
  };

});

export default DOMFooter;
