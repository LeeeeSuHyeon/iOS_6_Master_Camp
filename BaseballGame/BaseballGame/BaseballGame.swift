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
    
    // 안내 문구
    mutating func setGame(){
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print("1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            
            guard let input = readLine(), // 사용자의 input
                  let selectedNum = Int(input), // 입력 받은 값을 Int로 변환
                  1 <= selectedNum && selectedNum <= 3 // 입력 받은 값이 1~3 사이의 숫자인지 확인
            else {
                print("올바른 숫자를 입력해주세요!")
                continue
            }
            
            switch selectedNum {
            case 1: // 게임 시작하기
                self.start()
            case 2: // 게임 기록 보기
                return
            case 3: // 종료하기
                return
            default: // 1, 2, 3을 제외한 값
                print("올바른 숫자를 입력해주세요!")
            }
        }
    }
    
    // 게임 시작
    mutating func start() {
        self.answer = createAnswer() // 랜덤 정답 숫자 생성
        print(answer ?? "")
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
    
    //MARK:  Lv1. 정답 숫자 랜덤 생성 (1~9)
//    func createAnswer() -> [String] {
//        var numSet: Set<String> = [] // Set은 중복 허용 안 함, 순서 없음
//        while numSet.count < 3 { // Set의 개수가 3개가 될 때까지 랜덤 숫자 추가
//            numSet.insert(String(Int.random(in: 1...9))) // 1~9까지 랜덤 숫자를 생성하여 numSet에 추가 (Set은 중복 허용 안 하므로 중복 방지)
//        }
//
//        return Array(numSet)
//    }
    
    //MARK:  Lv3. 정답 숫자 랜덤 생성 (0~9): Set은 순서가 없기에 백의 자리 수의 0을 필터링해도 return 될 때 순서가 바뀔 수 있음
//    func createAnswer() -> [String] {
//        var numSet: Set<String> = [] // Set은 중복 허용 안 함, 순서 없음
//        while numSet.count < 3 { // Set의 개수가 3개가 될 때까지 랜덤 숫자 추가
//            let num = Int.random(in: 0...9)
//            if numSet.isEmpty && num == 0 { continue } // 첫자리가 0이면 continue
//            numSet.insert(String(num)) // 0~9까지 랜덤 숫자를 생성하여 numSet에 추가 (Set은 중복 허용 안 하므로 중복 방지)
//        }
//
//        return Array(numSet)
//    }
    
    
    //MARK:  Lv3. 정답 숫자 랜덤 생성 (0~9): Set -> Array로 수정
    func createAnswer() -> [String] {
        var numArr: [String] = [] // 자릿수를 저장할 배열
        while numArr.count < 3 { // 배열의 크기가 3개가 될 때까지 랜덤 숫자 추가
            let num = String(Int.random(in: 0...9)) // 0~9까지의 랜덤 숫자 생성
            if (numArr.isEmpty && num == "0") || numArr.contains(num) { continue } // 첫자리가 0이거나 이미 배열에 포함된 수(중복)이면 continue
            numArr.append(num) // 첫자리가 0이 아니고 중복된 수도 아니면 배열에 삽입
        }

        return numArr
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
        guard let intInput = Int(input) else { return false }
        let filteredInput = Set(String(intInput).map{$0})
        
        if filteredInput.count == 3 {
            return true
        } else { // 배열의 개수가 3개가 아니면 잘못된 값을 입력한 것
            print("올바르지 않은 입력 값입니다.")
            return false
        }
    }
}
