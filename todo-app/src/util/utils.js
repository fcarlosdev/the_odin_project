import DOMSearch from '../ui/dom-search'

const Utils = (() => {

  const controlListTasksVibility = projectEL => {
        let tasks = DOMSearch().getChildren(projectEL,1)
        if (tasks !== undefined)
          tasks.style.display = (tasks.children.length > 0) ? 'flex' : 'none'
    }

  return {
    controlListTasksVibility
  }

})

export default Utils
