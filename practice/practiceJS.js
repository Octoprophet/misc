const input1 = document.getElementById('input1');
const input2 = document.getElementById('input2');
const input3 = document.getElementById('input3');
const triangleSize = document.getElementById('triangle');

let side1;
let side2;
let side3;

input1.addEventListener("change", function() {
    side1 = parseFloat(input1.value);
    updateSizes();
});

input2.addEventListener("change", function() {
    side2 = parseFloat(input2.value);
    updateSizes();
});

input3.addEventListener("change", function (){
    side3 = parseFloat(input3.value);
    updateSizes()
})

function updateSizes() {
    if (!isNaN(side1) && !isNaN(side2) && !isNaN(side3)) {
        const sides = side1 + side2 + side3;
        triangleSize.innerHTML = sides;
    } else {
        triangleSize.innerHTML = "Please enter a value for each side"
    }
}

// input2.addEventListener("change", function() {
//     side2 = input2.value;
// });

// input3.addEventListener("change", function() {
//     side3 = input3.value;
// });



// const calculate = document.getElementById('calculate');

// function calculateArea() {
//     var allSides = side1 + side2 + side3;
//     triangleSize.innerHTML = allSides;    
// }