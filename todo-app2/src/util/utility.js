const Util = (() => {

  const setProjectHeight = project => {

    let finalHeight = 80;
    for (let h = 0; h < project.children[1].children.length; h++) {
      finalHeight += 48;
    }

    project.style.height = (finalHeight < 282) ? finalHeight + 'px' : '320px';

  };

  return {
    setProjectHeight,
  };

});

export default Util;
