import DOMElement from './dom-elem'
import DOMSearch from './dom-search'
import DOMFormTask from './dom-task-form'

const ProjectUI = (() => {

    const withTasks = () => DOMElement('div').addClasses(['tasks']).element

    const withBtAddTask = (toTaskList, project) =>
        DOMElement('span').setContent('Add task')
            .addClasses(['bt', 'bt-add'])
            .attachEvent('click', () => DOMFormTask(toTaskList, project).show())
            .element

    const withBtDelProject = (project, controller) =>
        DOMElement('span').setContent('X')
            .addClasses(['bt', 'bt-remove'])
            .attachEvent('click', event => {
                if (controller.removeProject(project.id))
                    DOMSearch().getGrandParentElement(event.target, 3).remove()
            }).element

    const witButtons = (withBtAddTask, withBtDelProject) =>
        DOMElement('div').addClasses(['bt-wrapper'])
            .addChildren([withBtAddTask, withBtDelProject])
            .element

    const withTitle = project =>
        DOMElement('h3').setContent(project.name).element

    const withHeader = (withTitle, withActionButtons) =>
        DOMElement('div').addClasses(['project-header'])
            .addChildren([withTitle, withActionButtons]).element

    const create = (project, withHeader, tasks) =>
        DOMElement('div').addClasses(['project'])
            .addAttributes({ id: 'Project' + project.id, storageId: project.id })
            .addChildren([withHeader, tasks])
            .element

    return {
        withTasks, withBtAddTask, withBtDelProject,
        witButtons, withTitle, withHeader,
        create
    }
})

export default ProjectUI