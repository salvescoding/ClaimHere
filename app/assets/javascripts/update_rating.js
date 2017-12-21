
document.querySelectorAll(".stars button").forEach(function(item){
  item.addEventListener('click', function(event) {
    console.log(event.currentTarget.parentElement.parentElement)
    let buttons = event.currentTarget.parentElement.parentElement.querySelectorAll('button')
      let stop = false
    buttons.forEach((button) => {
      if(button == event.currentTarget) {
        stop = true
        button.querySelector('i').classList.add('fa-star')
        button.querySelector('i').classList.remove('fa-star-o')

      } else if (stop) {
        button.querySelector('i').classList.remove('fa-star')
        button.querySelector('i').classList.add('fa-star-o')
      }
      else {
        button.querySelector('i').classList.add('fa-star')
        button.querySelector('i').classList.remove('fa-star-o')
      }
    })
  })
})
