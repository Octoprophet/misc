const prices = document.querySelectorAll('.price-input input');
const ranges = document.querySelectorAll('.range-input input');

let difference = 500
// prices.forEach(price => {
//     price.addEventListener('input', function() {
//         let minPrice = parseInt(prices[0].value);
//         let maxPrice = parseInt(prices[1].value);
//         let minRange = parseInt(ranges[0].value);
//         let maxRange = parseInt(ranges[1].value);
//         console.log(minPrice, maxPrice, minRange, maxRange);
//         minRange = minPrice;
//         maxRange = maxPrice;
//     })
// })

prices.forEach(price => {
    price.addEventListener('input', function() {
        let minPrice = prices[0];
        let maxPrice = prices[1];
        let minRange = ranges[0];
        let maxRange = ranges[1];
        console.log(minPrice, maxPrice, minRange, maxRange);
        let minPriceInt = parseInt(minPrice.value);
        let maxPriceInt = parseInt(maxPrice.value);
        let minRangeInt = parseInt(minRange.value);
        let maxRangeInt = parseInt(maxRange.value)
        minRange.value = minPrice.value;
        maxRange.value = maxPrice.value;
        if (minPriceInt < 0) {
            minPrice.value = 0;
        }
        if (maxPriceInt > 10000) {
            maxPrice.value = 10000;
        }
        if (minPrice.value >= maxPrice.value) {
            minPrice.value = maxPrice.value;
        }
        if (maxPriceInt <= minPriceInt){
            maxPrice.value = minPrice.value;
        }
    })
})