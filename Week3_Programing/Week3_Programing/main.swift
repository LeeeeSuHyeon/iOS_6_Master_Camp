//
//  main.swift
//  Week3_Programing
//
//  Created by 이수현 on 3/17/25.
//

import Foundation

// MARK: 필수문제 1 테스트
let problem1 = Problem1()
problem1.mission()


// MARK: 필수문제 2 테스트
let problem2 = Problem2()
problem2.mission1()
problem2.mission2() // ["2", "4", "6", "8", "10"]
problem2.mission3() // ["1", "2", "3", "4", "5"]


// MARK: 필수문제 3 테스트
let problem3 = Problem3()
problem3.testA() // 출력: [1, 3, 5]
problem3.testB() // 출력: ["가", "다", "마"]
problem3.testC() // 출력: [1, 3, 5] / 출력: ["가", "다", "마"]
problem3.testD() // 출력: [1, 3, 5]


// MARK: 도전문제 1 테스트
// HybridCar 인스턴스를 생성
let hybridCar = HybridCar(brand: "KIA", model: "쏘렌토 하이브리드", year: "2024", engine: HydrogenEngine())

// switchEngine(to:) 를 호출하여 서로 다른 타입의 엔진으로 교체
print("이전 엔진: \(hybridCar.engine)") // 이전 엔진: Week3_Programing.HydrogenEngine
hybridCar.switchEngine(to: ElectricEngine()) // 엔진 교체 HydrogenEngine -> ElectricEngine
print("이후 엔진: \(hybridCar.engine)") // 이후 엔진: Week3_Programing.ElectricEngine


// MARK: 상속을 사용하여 기능을 추가하는 것과, 프로토콜 채택을 통해서 기능을 추가하는 것의 장단점, 차이
/*
 상속의 장점
 1. 상속을 사용하면 부모 클래스가 정의한 프로퍼티, 메서드를 사용할 수 있습니다
 2. 필요에 따라 override하여 재정의 할 수 있습니다.
 3. 부모 클래스에서 정의한 코드를 재사용할 수 있어 코드의 중복을 방지할 수 있습니다.
 
 상속의 단점
 1. 상속은 단일 상속만 가능합니다
 2. 부모 클래스의 변경이 자식 클래스에게 큰 영향을 미칩니다
 3. 불필요한 기능까지 상속받게 됩니다
 
 프로토콜 채택 장점
 1. 프로토콜을 채택하면 추상화가 가능하고 필수로 구현되어야 하는 메서드를 정의할 수 있습니다
 2. 다중 채택이 가능합니다
 3. 클래스 뿐만 아니라 구조체, 열거형에서도 사용 가능합니다
 
 프로토콜 채택 단점
 1. 프로토콜에서는 구현부를 작성하지 않기 떄문에 코드 중복 가능성이 있습니다
 
 
 상속은 클래스만 사용 가능한 반면, 프로토콜은 클래스, 구조체, 열거형에서 사용할 수 있습니다.
 상속은 하나의 상속만 가능한 반면, 프로토콜을 다중 채택이 가능합니다
 상속은 상속받은 메서드, 프로퍼티를 사용하여 코드의 중복을 줄일 수 있지만, 프로토콜은 구현부를 작성하지 않아
    코드 중복 가능성이 있습니다.
 상속은 부모 클래스에 의존도가 높지만, 프로토콜은 상대적으로 의존도가 낮습니다.
 
 */
