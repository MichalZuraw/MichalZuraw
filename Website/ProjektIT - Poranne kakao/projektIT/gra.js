const dino = document.getElementById("dino");
const rock = document.getElementById("rock");
const score = document.getElementById("score");

function jump() {
  dino.classList.add("jump-animation");
  setTimeout(() =>
    dino.classList.remove("jump-animation"), 500);
}

document.addEventListener('keypress', (event) => {
  if (!dino.classList.contains('jump-animation')) {
    if(event.keyCode>=65){
    jump();}
  }
})
function ani(){
setInterval(() => {
  const dinoTop = parseInt(window.getComputedStyle(dino)
    .getPropertyValue('top'));
  const rockLeft = parseInt(window.getComputedStyle(rock)
    .getPropertyValue('left'));
  score.innerText++;

  if (rockLeft < 0) {
    rock.style.display = 'none';
  } else {
    rock.style.display = ''
  }

if (rockLeft < 50 && rockLeft > 0 && dinoTop > 150) {
    wynik=(score.innerText -1)
      alert("You got a score of: " + wynik +
      "\n\nPlay again?");
    location.reload();
  }
}, 50);
}
