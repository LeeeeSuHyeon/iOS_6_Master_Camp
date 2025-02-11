import Foundation

struct Queue {
    private var elements: [Int] = []
    
    // 데이터 삽입
    mutating func enqueue(_ element: Int) {
        elements.append(element)
    }
    
    // 데이터 제거
    mutating func dequeue() -> Int? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    // 큐의 현재 상태 출력
    func getQueueState() {
        print(elements)
    }
}

var queue = Queue()
[1, 2, 3, 4].map {queue.enqueue($0)}
queue.getQueueState() // [1, 2, 3, 4]
print(queue.dequeue()) // Optinoal(1)
queue.getQueueState() // [2, 3, 4]



struct Stack {
    private var elements: [String] = []
    
    mutating func push(_ element: String) {
        elements.append(element)
    }
    
    mutating func pop() -> String? {
        return elements.popLast()
    }
    
    func getTopElement() -> String? {
        return elements.last
    }
}

var stack = Stack()
["a", "b", "c", "d"].map{stack.push($0)}
print(stack.pop()) // Optional("d")
print(stack.getTopElement()) // Optional("c")


