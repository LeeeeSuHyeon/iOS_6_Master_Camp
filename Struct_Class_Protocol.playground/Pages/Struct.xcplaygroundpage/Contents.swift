import Foundation


// 1. Struct 구현
struct User {
    var name: String
    var age: Int
}

// User 객체 생성
var user1 = User(name: "User1", age: 20)
var user2 = user1

print(user1) // User(name: "User1", age: 20)
print(user2) // User(name: "User1", age: 20)

// user1의 name, age 속성 변경
user1.name = "changeName"
user1.age = 30

print(user1) // User(name: "changeName", age: 30)
print(user2) // User(name: "User1", age: 20)




