import DOMElement from '../ui/dom-elem'
import DOMSearch from '../ui/dom-search'
import DOMTaskList from '../ui/dom-task-list'

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
                        let task = DOMSearch().getGrandParentElement(event.target,2)
                        let project = DOMSearch().getGrandParentElement(task,2)
                        DOMTaskList().removeTask(task, project)
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
                ]).setContent(task.priority).element,

                DOMElement('span').addChildren([
                    DOMElement('input').addAttributes({id: 'chkDone', type: 'checkbox'})
                                       .attachEvent('click', () => { changeTaskDoneState(event.target) })
                                       .element
                ]).setContent('Done').element
            ]).element

    const changeTaskDoneState = checkbox => {
        let task = DOMSearch().getGrandParentElement(checkbox,3)
        let taskTitle = DOMSearch().getGrandSon(task,'h4')
        if (event.target.checked) {
            taskTitle.classList.add('task-done')
        } else {
            taskTitle.classList.remove('task-done')
        }
    }            

    return { create }
})

export default DOMTask
