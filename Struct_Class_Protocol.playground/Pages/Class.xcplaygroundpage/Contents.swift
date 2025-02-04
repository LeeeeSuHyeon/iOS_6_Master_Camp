

import Foundation

// 2. Class 사용 예제
class User {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

// User 클래스 객체 생성
var user1 = User(name: "User1", age: 20)
var user2 = user1

print(user1.name, user1.age) // User1 20
print(user2.name, user2.age) // User1 20


// user1의 name, age 속성 변경
user1.name = "changeName"
user1.age = 30

print(user1.name, user1.age) // changeName 30
print(user2.name, user2.age) // changeName 30

