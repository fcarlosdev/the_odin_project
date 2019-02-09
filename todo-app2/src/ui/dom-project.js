import DOMElement from '../lib/dom-elem';
import DOMFooter from '../ui/dom-footer';
import DOMHeader from '../ui/dom-header';
import DOMTaskList from '../ui/dom-task-list';
import ProjectController from '../controllers/project-controller';

const DOMProject = ((id, name) => {

  const createProject = () => {

    ProjectController().save(id,name);

    let byName = ProjectController().findByName(name);
    console.log(byName);
    
    let domProject = newProject(id, name);
    return domProject.addChildren(
      [DOMHeader(domProject.element, name, 'project-header').createHeader(),
        DOMTaskList().createTaskList(),
        DOMFooter().createProjectFooter(domProject.element),
      ]).element;

  };

  const newProject = (id, name) =>
    DOMElement('div').addClasses('project').addAttributes({
      id: 'project' + id,
    });

  return {
    createProject,
  };

});

export default DOMProject;
