import DOMElement from './dom/dom-elem'
import DOMSearch from './dom/dom-search'
import DOMFormTask from './dom/dom-task-form'

const TodoApp = (() => {

    const createTaskListWrapper = () => DOMElement('div').addClasses(['tasks']).element

    const createBtAddTask = (tasksWrapper, project) =>
        DOMElement('span').setContent('Add task')
            .addClasses(['bt', 'bt-add'])
            .attachEvent('click', () => DOMFormTask(tasksWrapper, project).show())
            .element

    const createBtDelProject = (project, controller) =>
        DOMElement('span').setContent('X')
            .addClasses(['bt', 'bt-remove'])
            .attachEvent('click', event => {
                if (controller.removeProject(project.id))
                    DOMSearch().getGrandParentElement(event.target, 3).remove()
            }).element

    const createButtonsWrapper = (btAddtask, btDelProject) =>
        DOMElement('div').addClasses(['bt-wrapper'])
            .addChildren([btAddtask, btDelProject])
            .element

    const createProjectTitle = project =>
        DOMElement('h3').setContent(project.name).element

    const createProjectHeader = (projectTitle, buttonsWrapper) =>
        DOMElement('div').addClasses(['project-header'])
            .addChildren([projectTitle, buttonsWrapper]).element

    const createProjectEL = (project, headerEL, tasksEL) =>
        DOMElement('div').addClasses(['project'])
            .addAttributes({ id: 'Project' + project.id, storageId: project.id })
            .addChildren([headerEL, tasksEL])
            .element



    return {
        createTaskListWrapper, createBtAddTask, createBtDelProject,
        createButtonsWrapper, createProjectTitle, createProjectHeader,
        createProjectEL
    }
})

export default TodoApp