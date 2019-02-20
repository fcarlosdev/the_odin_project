import DOMSearch from '../dom/dom-search'

const Utils = (() => {

  const controlListTasksVibility = projectEL => {
        let tasks = DOMSearch().getChildren(projectEL,1)
        tasks.style.display = (tasks.children.length > 0) ? 'flex' : 'none'
    }

  return {
    controlListTasksVibility
  }

})

export default Utils
