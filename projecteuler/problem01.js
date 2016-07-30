var sumOfMultiplesOfThree = 0;
var sumOfMultiplesOfFive = 0;


for (var i = 0; i < 1000; i ++ ) {
    if ( i % 3 === 0 && i % 5 === 0) {
        sumOfMultiplesOfThree += i;
        sumOfMultiplesOfFive += i;
    } else if ( i % 3 === 0 && i % 5 !== 0) {
        sumOfMultiplesOfThree += i;
    } else if ( i % 3 !== 0 && i % 5 === 0) { 
        sumOfMultiplesOfFive += i;
    }    
    
}

console.log("SumMultiplesOfThree + SumMultiplesOfFive: " + sumOfMultiplesOfThree + sumOfMultiplesOfFive);

