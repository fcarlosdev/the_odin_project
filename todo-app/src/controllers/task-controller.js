import Task from '../models/task'

const TaskController = (() => {

    const create = (task) => 
        Task(task.id, task.title, task.description, 
             task.dueDate, task.priority)

    return {
        create
    }

})

export default TaskController