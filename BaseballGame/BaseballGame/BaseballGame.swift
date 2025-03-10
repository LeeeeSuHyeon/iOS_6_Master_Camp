//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 이수현 on 3/10/25.
//

import Foundation

// 상속, 참조 필요없으므로 struct 사용
struct BaseballGame {
    // 정답
    var answer: [String]?
    
    // 게임 시작
    mutating func start() {
        self.answer = createAnswer() // 랜덤 정답 숫자 생성
        print("< 게임을 시작합니다 >")
        
        // 정답일 때까지 반복
        while let input = readLine() {
            print("숫자를 입력하세요")
            
            if validationInput(input: input) { // 입력 값 검증
                if checkAnswer(input: input) { // 정답 검증
                    print("정답입니다!")
                    break
                }
            }
        }
    }
    
    // 정답 숫자 랜덤 생성
    func createAnswer() -> [String] {
        var numSet: Set<String> = [] // Set은 중복 허용 안 함, 순서 없음
        while numSet.count < 3 { // Set의 개수가 3개가 될 때까지 랜덤 숫자 추가
            numSet.insert(String(Int.random(in: 1...9))) // 1~9까지 랜덤 숫자를 생성하여 numSet에 추가 (Set은 중복 허용 안 하므로 중복 방지)
        }

        return Array(numSet)
    }
    
    // 정답 체크
    func checkAnswer(input: String) -> Bool {
        var strikeCount = 0 // 스트라이크 수
        var ballCount = 0   // 볼 수
        let input = input.map{String($0)} // 사용자가 입력한 값
        
        guard let answer = answer else { // 정답 값
            print("정답 숫자를 먼저 생성해주세요.")
            return false
        }
        
        for i in 0...2 {
            // Strike 확인
            if input[i] == answer[i] {
                strikeCount += 1
                continue // 중복 숫자는 없기 때문에 continue
            }
            
            // Ball 확인
            for j in 0...2 {
                if i == j { continue } // 이미 위에서 스트라이크 처리 되었으므로 continue
                if input[i] == answer[j] {
                    ballCount += 1
                    continue
                }
            }
        }
        
        if strikeCount == 3 { // 3 스트라이크면 정답
            return true
        } else {
            let message = strikeCount == 0 && ballCount == 0 ? "Nothing" : "\(strikeCount)스트라이크 \(ballCount)볼"
            print(message)
            return false
        }
    }
    
    /* 입력값 검사
     1. 입력값이 세글자인지 확인
     2. 숫자가 아닌 값 (compactMap: 옵셔널 값 없앰)
     3. 숫자 0 확인 (filter)
     4. 중복 처리 (Set)
    */
    func validationInput(input: String) -> Bool {
        if input.count != 3 { return false } // 1.
        let a = Set(input.compactMap{Int(String($0))}.filter{$0 != 0}) // 2, 3, 4
        
        if a.count == 3 {
            return true
        } else { // 배열의 개수가 3개가 아니면 잘못된 값을 입력한 것
            print("올바르지 않은 입력 값입니다.")
            return false
        }
    }
}
