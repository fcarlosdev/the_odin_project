const TodoElementParams = (type,textNode) => ({

  type,
  textNode,
  attributes: undefined,
  classes: undefined,
  styles: undefined,

  withAttributes(listOfAttributes) {
    this.attributes = listOfAttributes;
    return this;
  },

  withClasses(listOfClasses) {
    this.classes = listOfClasses;
    return this;
  },

  withStyles(listOfStyles) {
    this.styles = listOfStyles;
    return this;
  }

});

export default TodoElementParams;
