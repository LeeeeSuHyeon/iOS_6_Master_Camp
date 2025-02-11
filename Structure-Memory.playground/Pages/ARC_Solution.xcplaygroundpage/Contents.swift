import UIKit

// weak 약한 참조 선언: 순환 참조 문제를 해결하기 위해
// weak로 선언하면, 참조할 때 카운팅이 되지 않음
class Person {
    var name: String
    weak var pet: Pet? // weak 약한 참조 선언
    
    init(name: String) {
        self.name = name
    }
    
    // 객체가 메모리에서 해제되기 직전에 호출됨
    deinit {
        print("\(name) is deinitalized")
    }
}

class Pet {
    weak var owner: Person?  // weak 약한 참조 선언
    
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
CFGetRetainCount(soo) // 2 (soo를 참조했지만, weak 약한 참조를 했기 때문에 참조 카운트를 증가시키지 않음)

// cat 객체 참조 추가
soo?.pet = cat
CFGetRetainCount(cat) // 2 (soo를 참조했지만, weak 약한 참조를 했기 때문에 참조 카운트를 증가시키지 않음)

// 메모리 해제
soo = nil // soo is deinitalized / 메모리에서 해제, deinit 메서드가 호출 
cat = nil // Pet is deinitalized / 메모리에서 해제, deinit 메서드가 호출

 
