import Foundation

// 간단한 클로저 구현
let numbers = [1, 2, 3, 4, 5]
let doubled = numbers.map { number in
    return number * 2
}

print(doubled) // [2, 4, 6, 8, 10]

// 클로저 캡처 이해
var counter = 0
let incrementCount = {
    counter += 1
}

incrementCount() // 1
incrementCount() // 2
print(counter) // 2
