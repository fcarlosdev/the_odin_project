//What is the largest prime factor of the number 600851475143 ?
var number = 600851475143;
var divider = 2;
var largestPrimeFactor = 0;

while ( number > 1) {
    resto = (number % divider);
    if ( resto === 0 ) {
        number /= divider;
        if ( largestPrimeFactor < divider) {
          largestPrimeFactor = divider;
        }
    } else {
        divider++;
    }
}
console.log("The largest prime factor is: " + largestPrimeFactor);
