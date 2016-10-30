var sum = 0;
var x = 1;
var y = 2;
while ( x < 4000000 ) {
    
    if ( x % 2 === 0) {        
        sum += x;
    }     
    z = x + y;
    x = y;
    y = z;        
} 
console.log("Sum = " + sum);
