const colorButton = document.getElementById("colorButton")
const body = document.querySelector('body')
const button = document.querySelector('button')
const mainText = document.querySelector('#title h1')
const colorArray = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
let letters = "0123456789ABCDEF";
const switcher = document.getElementsByName('switcher');
let swap = 0;

function rainbow() {
    swap = 0;
    return swap
}

function hex() {
    swap = 1;
    return swap;
}

function colorChanger() {
    const randomNumber = Math.floor(Math.random() * 7);
    let randomColor = colorArray[randomNumber];
    let hexColor = "#";

    for (let i = 0; i < 6; i++){
        hexColor += letters[(Math.floor(Math.random() * 16))]
    };
    console.log(swap)
    if (swap == 0) {
        body.style.background = randomColor;
        colorButton.style.background = randomColor;
        mainText.innerText = `Background Color: ${randomColor}`;
    };
    if (swap == 1) {
        body.style.background = hexColor;
        colorButton.style.background = hexColor;
        mainText.innerText = `Background Color: ${hexColor}`;
    }
}
