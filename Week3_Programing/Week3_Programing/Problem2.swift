//
//  Problem2.swift
//  Week3_Programing
//
//  Created by 이수현 on 3/20/25.
//

import Foundation

// MARK: 필수 문제 2.
class Problem2 {
    func mission1(){
        let numbers = [1, 2, 3, 4, 5]
        var result = [String]()
        
        // forEach 사용
//        numbers.forEach { number in
//            result.append("\(number)")
//        }
        
        // map 사용
        numbers.map{result.append(String($0))}
    }

    // 짝수만 남기고 String 타입으로 변환
    func mission2(){
        let input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        print(input.filter{$0 % 2 == 0}.map{String($0)}) // [”2”, “4”, “6”, “8”, “10”]
    }
    
    func myMap(_ arr: [Int], closure: (Int) -> String) -> [String]{
        arr.map{closure($0)}
    }
    
    func mission3(){
        let result = myMap([1, 2, 3, 4, 5]) {
            String($0)
        }
        print(result)  // ["1", "2", "3", "4", "5"]
    }
}
