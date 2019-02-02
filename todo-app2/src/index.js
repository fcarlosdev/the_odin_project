import './css/main.css';
import DOMProject from './ui/dom-project';

// import DOMSearch from './lib/dom-search-elem';

let projects = document.querySelector('.projects');
let fieldProjectName = document.querySelector('#proj-txt-name');

document.querySelector('#bt-add-prj').addEventListener('click',
    () => {
        let projId = projects.children.length + 1;
        let project = DOMProject().createProject(projId, getProjectName());

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
