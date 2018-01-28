console.log(window.innerWidth);

(function() {
  fixBrowserHeight();
})();

window.onresize = function(){
  fixBrowserHeight();
};

function fixBrowserHeight() {
  var header = document.getElementById('header');
  var content = document.getElementsByClassName('content-wrapper')[0];
  var contentHeight = window.innerHeight - header.offsetHeight;

  if(contentHeight > content.offsetHeight) {
    content.style.minHeight = contentHeight + 'px';
  }
}

