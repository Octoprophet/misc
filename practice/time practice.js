const date = new Date();

const dayOfWeek = date.getDay();
const weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
const setDay = weekday[dayOfWeek];

function timeConversion() {
    const time = date.getHours();
    if (time > 12) {
        return time - 12 + " PM"
    } else if (time ==12) {
        return time + " Noon"
    } else {
        return time + "AM"
    }
}


const minutes = date.getMinutes();
const seconds = date.getSeconds();

document.getElementById('dayOfWeek').innerHTML = `Today is: ${setDay}`;
document.getElementById('time').innerHTML = `${timeConversion()} : ${minutes} : ${seconds}`;