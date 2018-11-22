function madLib(verb, adj, noun) {
    return 'We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.'
}

function isSubstring(string, substring) {
    return string.includes(substring);       
}

function FizzBuzz(array) {
    const new_array = [];
    array.forEach(el => {
        if ((el % 3 === 0) ^ (el % 5 === 0)) {
            new_array.push(el);
        }
    });
    
    return new_array;
}

function isPrime(num) {
    if (num < 2) { return false; }

    for (let i = 2; i <= i / 2; i++) {
        if (num % i === 0) {
            return false;
        }
    }
    
    return true;
}

function sumOfNPrime(n) {
    let sum = 0;
    let count = 1;
    let i = 2;

    until(count = n) {
        if (isPrime(i)) {
            sum += i;
            count++;
        }
        i++;
    }

    return sum;
}
