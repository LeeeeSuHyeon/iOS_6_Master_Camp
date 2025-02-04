import Foundation

// 프로토콜 정의
protocol Greetable {
    func greet() -> String
}

// Person
struct Person: Greetable {
    let name: String
    func greet() -> String{
        return "Hello!, \(name)"
    }
}

// Robot
class Robot: Greetable {
    let id = "Robot"
    func greet() -> String{
        return "Hello!, \(self.id)"
    }
}

// Person 객체 생성
let soo = Person(name: "soo")
print(soo.greet()) // Hello!, soo

// Robot 객체 생성
let robot = Robot()
print(robot.greet()) // Hello!, Robot


// 4. 프로토콜 확장
extension Greetable {
    func greet() -> String {
        return "Hello!"
    }
}

// Alien
struct Alien: Greetable {}

// Alien 객체 생성
let alien = Alien()
print(alien.greet()) // Hello!

