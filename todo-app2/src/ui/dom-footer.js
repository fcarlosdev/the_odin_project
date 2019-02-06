import DOMElement from '../lib/dom-elem';
import DOMButton from '../ui/dom-button';

import DOMFormTask from '../ui/dom-task-form';

const DOMFooter = (() => {

  const createProjectFooter = project =>
    DOMElement('div').addClasses('project-footer')
                            .addChildren([
                              createTaskLink(project, 'Task name'),
                            ]).element;

  const createTaskLink = (project, taskName) =>
    DOMButton('Span', '+ Add task').create('click', 
              () =>  DOMFormTask(project).show(),'newtask');

  return {
    createProjectFooter,
  };

});

export default DOMFooter;
