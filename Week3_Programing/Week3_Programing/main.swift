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
