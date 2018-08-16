function changesize() {
  if (arguments[0] != "60px") {
    document.getElementById('s-field').style.width = '92%';
    document.getElementById('s-field').style.outline = 'none';
    document.getElementById('s-field').removeAttribute('placeholder');
  } else {
    document.getElementById('s-field').setAttribute('placeholder','Search');
    document.getElementById('s-field').style.width = arguments[0];
  }
}
