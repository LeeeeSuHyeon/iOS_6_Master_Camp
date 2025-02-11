import Foundation

// 1. 제네릭 함수 작성
func swapValue<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var a = 10
var b = 20
swapValue(&a, &b)
print(a, b) // 20 10

// 2. 제네릭 스택 구현
struct Stack<T> {
    var elements: [T]? = []
    
    // 스택에 요소 추가
    mutating func push(_ element: T) {
        elements?.append(element)
    }
    
    // 스택에서 요소 제거
    mutating func pop() -> T? {
        return elements?.popLast()
    }
    
    // 스택의 현재 상태를 출력하는 메서드
    func printStack() {
        print(elements ?? "[]")
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
print(intStack.pop()) // Optional(2)
intStack.printStack() // [1]
