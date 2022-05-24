function dzien(){
  var d = new Date();
  var weekday = new Array(7);
  weekday[0] = "Niedziela";
  weekday[1] = "Poniedziałek";
  weekday[2] = "Wtorek";
  weekday[3] = "Środa";
  weekday[4] = "Czwartek";
  weekday[5] = "Piątek";
  weekday[6] = "Sobota";
  var n = weekday[d.getDay()];
  document.getElementById("dzien").innerHTML = n;
  setTimeout("dzien()", 1000); 
}