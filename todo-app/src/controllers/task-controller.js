import Task from '../models/task'
import Repository from '../data_store/repository'

const TaskController = (() => {

    const create = (id, title, description, dueDate, priority, projId) =>
      Task(id, title, description, dueDate, priority, projId)

    const generateId = toTaskFromProject => {
        return Repository().findProject(toTaskFromProject.id).tasks.length + 1
    }


    return {
        create, generateId
    }

})

export default TaskController
