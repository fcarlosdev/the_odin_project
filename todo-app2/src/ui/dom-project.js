import DOMElement from '../lib/dom-elem';
import DOMFooter from '../ui/dom-footer';
import DOMHeader from '../ui/dom-header';
import DOMTaskList from '../ui/dom-task-list';

const DOMProject = ((id, name) => {

  const createProject = () => {
    let project = newProject(id, name);
    return project.addChildren(
      [DOMHeader(project.element, name, 'project-header').createHeader(),
        DOMTaskList().createTaskList(),
        DOMFooter().createProjectFooter(project.element),
      ]).element;

  }

  const newProject = (id, name) =>
    DOMElement('div').addClasses('project').addAttributes({
      id: 'project' + id
    });

  return {
    createProject,
  };

});

export default DOMProject;
