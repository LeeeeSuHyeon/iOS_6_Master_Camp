//
//  Problem1.swift
//  Week3_Programing
//
//  Created by 이수현 on 3/20/25.
//

import Foundation

// MARK: 필수 문제 1.
class Problem1 {
    // 두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저를 설계
    let sum: (Int, Int) -> String = { a, b in
        let sum = a + b
        return "두 수의 합은 \(sum)입니다" // 클로저 내부에서는 두 정수를 더한 후, "두 수의 합은 {합계} 입니다"라는 문자열을 반환
    }

    // sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성
    let calculate: ((Int, Int) -> String) -> Void = { closure in
        print(closure(10, 20)) // (조건) calculate 함수 구현 내에서는 파라미터로 전달받은 클로저를 호출하는 코드를 포함
    }
    
    func mission(){
        let reuslt = sum(10, 20) // sum 호출 코드
    }
}
