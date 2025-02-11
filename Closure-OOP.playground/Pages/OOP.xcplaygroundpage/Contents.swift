import Foundation

// Animal 클래스
class Animal {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("Animal - makeSound()")
    }
}

// Dog 클래스
class Dog: Animal {
    override func makeSound() {
        print("Bark!")
    }
}

// Cat 클래스
class Cat: Animal {
    override func makeSound() {
        print("Meow!")
    }
}

// Dog 객체 생성
let dog = Dog(name: "dog")
dog.makeSound() // Bark!

// Cat 객체 생성
let cat = Cat(name: "cat")
cat.makeSound() // Meow!


