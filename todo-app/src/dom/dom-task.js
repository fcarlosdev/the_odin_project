import DOMElement from '../dom/dom-elem'
import DOMSearch from '../dom/dom-search'
import ProjectController from './controllers/project-controller'
import TaskController from './controllers/task-controller'

const DOMTask = ((task) => {

    const create = () =>
        DOMElement('div').addClasses(['task','box'])
            .addAttributes({ id: 'Task' + task.id, storageId: task.id })
            .addChildren([createTaskHeader(), createTaskContent(), createTaskFooter()])
            .element


    const createTaskHeader = () =>
        DOMElement('div').addClasses(['task-header'])
            .addChildren([
                DOMElement('h4').setContent(task.title).element,
                DOMElement('span').addClasses(['bt-task','bt-remove'])
                    .attachEvent('click', () => {
                        console.log(event.target.parentElement.parentElement.getAttribute('storageId'))                        
                        DOMSearch().getGrandParentElement(event.target,2).remove();
                        //event.target.parentElement.parentElement.remove();
                    }).setContent('X').element
            ]).element

    const createTaskContent = () =>
        DOMElement('div').addClasses(['task-content'])
            .addChildren([DOMElement('p').setContent(task.description).element])
            .element

    const createTaskFooter = () =>
        DOMElement('div').addClasses(['task-footer'])
            .addChildren([
                DOMElement('span').addChildren([
                    DOMElement('span').addClasses(['bold-label']).setContent('Due date: ').element
                ]).setContent(task.dueDate).element,

                DOMElement('span').addChildren([
                    DOMElement('span').addClasses(['bold-label']).setContent('Priority: ').element
                ]).setContent(task.priority).element
            ]).element

    return { create }
})

export default DOMTask
