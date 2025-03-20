//
//  Problem3.swift
//  Week3_Programing
//
//  Created by 이수현 on 3/20/25.
//

import Foundation

// MARK: 필수 문제 3.
class Problem3 {
    // Int 배열의 짝수번째 요소를 제거해서 반환하는 함수 a
    func a(arr: [Int]) -> [Int] {
        // 인덱스는 0부터 시작이므로 짝수번째 요소 제거는 offset이 홀수인 요소룰 제거해야 함
        return arr.enumerated().filter{$0.offset % 2 == 0}.map{$0.element}
    }

    // String 배열의 짝수번째 요소를 제거해서 반환하는 함수 b
    func b(arr: [String]) -> [String] {
        // 인덱스는 0부터 시작이므로 짝수번째 요소 제거는 offset이 홀수인 요소룰 제거해야 함
        return arr.enumerated().filter{$0.offset % 2 == 0}.map{$0.element}
    }

    // 위 두 함수를 하나의 함수로 대체할 수 있는 방법을 고민해보고, 함수 c
    func c<T>(arr:[T]) -> [T]{
        return arr.enumerated().filter{$0.offset % 2 == 0}.map{$0.element}
    }
    
    // 함수 c 를 기반으로 수정하여 함수 d
    // 파라미터의 타입을 << 'Numeric 프로토콜'을 준수하는 타입의 요소를 가진 배열 >> 로 변경
    func d<T>(arr: [T]) -> [T] where T: Numeric{
//        c(arr: arr)
        return arr.enumerated().filter{$0.offset % 2 == 0}.map{$0.element}
    }

    
    // MARK: 필수 문제 3 테스트
    func testA(){
        print(a(arr: [1, 2, 3, 4, 5]))  // 출력: [1, 3, 5]
    }
    
    func testB() {
        print(b(arr: ["가", "나", "다", "라", "마"])) // 출력: ["가", "다", "마"]
    }
    
    func testC() {
        print(c(arr: [1, 2, 3, 4, 5]))  // 출력: [1, 3, 5]
        print(c(arr: ["가", "나", "다", "라", "마"])) // 출력: ["가", "다", "마"]
    }
    
    func testD() {
        print(d(arr: [1, 2, 3, 4, 5])) // 출력: [1, 3, 5]
        //print(d(arr: ["가", "나", "다", "라", "마"])) // Global function 'd(arr:)' requires that 'String' conform to 'Numeric'
    }
}
