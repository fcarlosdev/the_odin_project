import './css/main.css';
import './css/task-form.css';
import DOMProject from './ui/dom-project';

let projects = document.querySelector('.projects');
let fieldProjectName = document.querySelector('#proj-txt-name');

document.querySelector('#bt-add-prj').addEventListener('click',
  () => {
    let projId = projects.children.length + 1;
    let name = getProjectName();
    let project = DOMProject(projId, name).createProject();

    if (project.children[1].children.length == 0) {
      project.style.height = '80px';
    }

    addProjectToProjectList(project);
  }
);

const getProjectName = () => fieldProjectName.value;

const addProjectToProjectList = project => {
  projects.appendChild(project);
  clearFieldText();
};

const clearFieldText = () => {
  fieldProjectName.value = '';
};
