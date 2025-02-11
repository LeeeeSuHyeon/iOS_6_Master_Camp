import UIKit

class Person {
    var name: String
    var pet: Pet?
    
    init(name: String) {
        self.name = name
    }
    
    // 객체가 메모리에서 해제되기 직전에 호출됨
    deinit {
        print("\(name) is deinitalized")
    }
}

class Pet {
    var owner: Person?
    
    // 객체가 메모리에서 해제되기 직전에 호출됨
    deinit {
        print("Pet is deinitalized")
    }
}

// Person 객체 생성
var soo: Person? = Person(name: "soo") // Person Reference Count(RC) = 1 (객체 생성 시 참조 카운트 1 증가)
// CFGetRetainCount: 참조 카운팅 확인 메서드 (0이 아닌, 1이 되어야 메모리 해제 됨)
CFGetRetainCount(soo) // 2

// Pet 객체 생성
var cat: Pet? = Pet() // Pet RC = 1
CFGetRetainCount(cat) // 2

// soo 객체 참조 추가
cat?.owner = soo
CFGetRetainCount(soo) // 3 (soo를 참조했으므로, RC 1 증가)

// cat 객체 참조 추가
soo?.pet = cat
CFGetRetainCount(cat) // 3

// 메모리 해제
soo = nil // 메모리에서 해제되지 않음, deinit 메서드가 호출되지 않음 / CFGetRetainCount -> 2
cat = nil // 메모리에서 해제되지 않음, deinit 메서드가 호출되지 않음 / CFGetRetainCount -> 2
// -> 참조가 있기 때문에 nil로 선언해도 메모리에서 해제되지 않음
 
