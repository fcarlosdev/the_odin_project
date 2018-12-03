import {elementUtil} from '../util/util.js';

const taskForm = (app) => {

  const elementFactory = elementUtil(app);

  const createElement = (type, value, attributes, classes, styles) => {
    let newElement = elementFactory.create(type,value);
        elementFactory.applyAttributesTo(newElement,attributes);
        elementFactory.applyClassesTo(newElement,classes);
        elementFactory.applyStylesTo(newElement,styles);
    return newElement;
  }

  const getPropertiesFrom = (formContainer) => {

    let formContainers = {
      "titleBox":{ type: "div", value: "", attributes: {}, classes: [],
                 styles: {"width:": "20%", "margin-right:": "20px"} },
      "descriptionBox":{type: "div", value: "", attributes: {}, classes: [],
                        styles: {"width:": "45%", "margin-right:": "20px"}},
      "dueDateBox": {type: "div", value: "", attributes: {}, classes: [],
                   styles: {"width:": "10%", "margin-right:": "20px"}},
      "priorityBox":{type: "div", value: "", attributes: {}, classes: [],
                   styles: {"width:": "10%", "margin-right:": "10px"}}
    }
    return formContainers[formContainer];
  }

  const getInputProperties = (input) => {

    const inputProperties = {
      "titleTxt": {
           type:"input", value:"",
           attributes:{ "id": "task-title", "placeholder": "Task Title" },
           classes:["input-data"], styles: {"width:": "100%"}
       },
      "descriptionTxt": {
        type:"input", value:"",
        attributes:{ "id": "task-desc", "placeholder": "Task description" },
        classes:["input-data"], styles: {"width:": "100%"}
      },
      "dueDateTxt": {
        type:"input", value:"",
        attributes:{ "id": "task-date", "placeholder": "Due Date" },
        classes:["input-data"], styles: {"width:": "100%"}
      },
      "priorityTxt": {
        type: "select", value: "", attributes: { "id": "sel-priority" },
        classes:["input-data"],
        styles: {"width:": "100%", "background-color:": "#fff", "color:": "#ccc"}
      }
    }
    return inputProperties[input];
  }

  const newFormField = (fieldName) => {

    let fieldBox = getPropertiesFrom(fieldName+"Box");
    let newField = createElement(fieldBox.type,fieldBox.value,fieldBox.attributes,
                                 fieldBox.classes,fieldBox.styles);

    let field = getInputProperties(fieldName+"Txt");
    newField.appendChild(createElement(field.type,field.value,field.attributes,
                                       field.classes,field.styles));
    return newField;
  }

  const configSelectField = (fieldName) => {

    fieldName.addEventListener('change', function() {
      fieldName.style.color =
        (fieldName.selectedIndex > 0) ? "black" : "#ccc";
    });

    ["Priority", "Low", "Medium", "High"].forEach(function(op){
      let option = app.createElement("option");
      if (op !== "Priority") {
        option.text = option.value = op;
      } else {
        option.text = op;
      }
      fieldName.add(option);
    });
  }

  const creatTask = (container) => {
    let title    = container.children[0].children[0].value;
    let descr    = container.children[1].children[0].value;
    let date     = container.children[2].children[0].value;
    let priority = container.children[3].children[0].value;
    return { title: title, description: descr, dueDate: date, priority: priority };
  }

  const newForm = (controller, todoTasks, taskId) => {

      taskId = taskId;
      controller = controller;
      let container = createElement("div","",{},["task-form"],{});

      let divTitle    = newFormField("title");
      let divDesc     = newFormField("description");
      let divDate     = newFormField("dueDate");
      let divPriority = newFormField("priority");
      configSelectField(divPriority.children[0]);

      container.appendChild(divTitle);
      container.appendChild(divDesc);
      container.appendChild(divDate);
      container.appendChild(divPriority);

      let btnSaveDiv = createElement("div","",{},[],{"width:":"auto","margin-right:":"10px;"});
      let btnCancelDiv = createElement("div","",{},[],{"width:":"auto"});

      btnSaveDiv.appendChild(createSaveButton(container,controller, taskId));
      btnCancelDiv.appendChild(createCancelButton());

      container.appendChild(btnSaveDiv);
      container.appendChild(btnCancelDiv);

      return container;
  }


  const createSaveButton = (container, controller, taskId) => {

    let btnSave = createElement("button","Save",{},["button-blue"],{"width:":"100%","height:": "100%"});

    btnSave.addEventListener('click',function() {

      let task = controller.newTask(creatTask(container));

      let tasksLine = document.createElement('div');
      tasksLine.style.display = "flex";
      tasksLine.style.justifyContent = "space-between";

      Object.keys(task).forEach(function(key){
          let value = task[key]()
          if (key != "getTitle") {
            tasksLine.appendChild(createElement("div",value,{},[],{}))
          } else {
            tasksLine.appendChild(createElement("div",value,{"id": taskId++},[],{}))
          }
      });

      Array.from(document.querySelectorAll(".task-form")).forEach(function(line){
        line.remove();
      });
      //   todoTasks.appendChild(tasksLine);
      //   // let todo = controller.newTodo(todoName);
      //   // todo.addTask(task);
      //   //Has to return to the controller
    });

    return btnSave;
  }

  const createCancelButton = () => {
    let btnCancel = document.createElement('button');
    btnCancel.style.width = "100%";
    btnCancel.style.height = "100%";
    btnCancel.textContent = "Cancel";
    btnCancel.classList.add("button-red");

    btnCancel.addEventListener('click', function() {
      Array.from(document.querySelectorAll(".task-form")).forEach(function(line){
        line.remove();
      });
    });

    return btnCancel;
  }



  return { newForm }

}

export { taskForm }
