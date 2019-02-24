import './assets/css/main.css'
import './assets/css/task-form.css'
import './assets/css/shared.css'
import DOMSearch from './ui/dom-search'
import Utils from './util/utils'
import TodoApp from './todo-app'

let txtProjName = DOMSearch().getElement('#field-project-name')
let app = TodoApp()

app.createDefaultProject('Learn JavaScript')
app.loadProjects()

DOMSearch().getElement('#bt-project').addEventListener('click', () => newProject())

txtProjName.addEventListener('keydown', event => {    
    if (event.keyCode === 13)
        newProject()
})



const newProject = () => {
    if (txtProjName.value.length > 0) {

        let projectUI = app.createProject(txtProjName.value)

        Utils().controlListTasksVibility(projectUI)

        txtProjName.value = ''
        txtProjName.focus()

    }

}