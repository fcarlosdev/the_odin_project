import DOMElement from '../lib/dom-elem';
import DOMFooter from  '../ui/dom-footer';
import DOMTaskList from  '../ui/dom-task-list';

const DOMProject = (() => {

  const createProject = (id, name) =>
    DOMElement('div').addClasses('project')
                     .addAttributes({ id: 'project' + id })
                     .addChildren([
                        createTitleElement(name),
                        DOMTaskList().createTaskList(),
                        DOMFooter().createProjectFooter(),
                      ]).element;

  const createTitleElement = withTitle =>
    DOMElement('h3').setContent(withTitle).element;

  return {
    createProject,
  };

});

export default DOMProject;
