



function startTimer(duration, display) 

{
    var timer = duration, minutes, seconds;
    
    setInterval(
        
        
        function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        time.innerHTML = minutes + ":" + seconds;

        if (--timer < 0) {
           window.location="#/over";

        }
    }, 1000);
}

window.onload = function () {
    var fiveMinutes = 61 * 1,
        display = document.querySelector('#time');
    startTimer(fiveMinutes, display);
};




