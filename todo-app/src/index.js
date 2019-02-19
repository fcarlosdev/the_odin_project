import './assets/css/main.css'
import './assets/css/task-form.css'
import './assets/css/shared.css'

import DOMElement from './dom/dom-elem'
import DOMSearch from './dom/dom-search'
import DOMFormTask from './dom/dom-task-form'

import ProjectController from './controllers/project-controller'

let txtProjName = DOMSearch().getElement('#field-project-name')
let projectsEL = DOMSearch().getElement('.projects')
let controller = ProjectController()

DOMSearch().getElement('#bt-project').addEventListener('click', () => {

    if (txtProjName.value.length > 0) {

        let project = controller.create(txtProjName.value)

        let tasksEL = DOMElement('div').addClasses(['tasks']).element

        let btAddTaskEL = DOMElement('span').setContent('Add task')
            .addClasses(['bt','bt-add'])
            .attachEvent('click', () => DOMFormTask(tasksEL, project).show()).element

        let btDelProject = DOMElement('span').setContent('X')
            .addClasses(['bt','bt-remove'])
            .attachEvent('click', event => {
                event.target.parentElement.parentElement.parentElement.remove();
                txtProjName.focus()
            }).element

        let buttonsWrapper = DOMElement('div').addClasses(['bt-wrapper'])
            .addChildren([btAddTaskEL, btDelProject])
            .element

        let projectTitleEL = DOMElement('h3').setContent(project.name).element

        let projectHeader = DOMElement('div').addClasses(['project-header'])
            .addChildren([projectTitleEL, buttonsWrapper]).element

        let projectEL = DOMElement('div').addClasses(['project'])
            .addAttributes({id: 'Project'+project.id, sotrageId: project.id})
            .addChildren([projectHeader, tasksEL ])
            .element

        projectsEL.appendChild(projectEL)

        txtProjName.value = ''
        txtProjName.focus()

    }

})
