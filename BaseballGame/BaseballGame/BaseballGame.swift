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
    var answer = [String]()
    
    // 시도 횟수
    var tryCount = [Int]()
    
    // 안내 문구
    mutating func setGame(){
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print("1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            
            guard let input = readLine(), // 사용자의 input
                  let selectedNum = Int(input), // 입력 받은 값을 Int로 변환
                  (1...3).contains(selectedNum) // 입력 받은 값이 1~3 사이의 숫자인지 확인
            else {
                print("올바른 숫자를 입력해주세요!")
                continue
            }
            
            switch selectedNum {
            case 1: // 게임 시작하기
                self.start()
            case 2: // 게임 기록 보기
                self.showTryCount()
            case 3: // 종료하기
                print("<숫자 야구 게임을 종료합니다>")
                return
            default: // 1, 2, 3을 제외한 값
                print("올바른 숫자를 입력해주세요!")
            }
            print()
        }
    }
    
    // 1. 게임 시작
    mutating func start() {
        var count = 1 // 시도 횟수
        self.answer = createAnswer() // 랜덤 정답 숫자 생성
        
        print(answer)
        print("< 게임을 시작합니다 >")
        
        // 정답일 때까지 반복
        while true {
            print("숫자를 입력하세요")
            guard let input = readLine() else { return }
            
            if validationInput(input: input) { // 입력 값 검증
                if checkAnswer(input: input) { // 정답 검증
                    print("정답입니다!")
                    print()
                    self.tryCount.append(count) // 정답일 때 시도 횟수 기록
                    break
                } else { // 틀렸을 때
                    count += 1
                }
            } else {
                print("올바르지 않은 입력 값입니다.")
            }
        }
    }
    
    // 2. 시도 횟수 보여주기
    func showTryCount() {
        for (index, value) in tryCount.enumerated() {
            print("\(index + 1)번째 게임 : 시도 횟수 - \(value)")
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
        
        for i in 0...2 {
            // Strike 확인
            if input[i] == answer[i] {
                strikeCount += 1
            } else { // Ball 확인
                ballCount += answer.contains(input[i]) ? 1 : 0
            }
        }
        
        if strikeCount == 3 { // 3 스트라이크면 정답
            return true
        } else if strikeCount == 0 && ballCount == 0 {
            print("Nothing")
            return false
        } else {
            print("\(strikeCount)스트라이크 \(ballCount)볼")
            return false
        }
    }
    
    //MARK: Lv3: 입력값 검사
    /* 조건
     1. 숫자가 아닌 값 확인 (백의 자리가 0인 String 값은 Int로 변환하면서 없어짐)
        Ex) "048" -> 48
     2. Int 값을 다시 String 배열로 변환하여 Set을 통해 중복값 삭제
     3. 필터링된 입력값이 3글자인지 확인
    */
    func validationInput(input: String) -> Bool {
        guard let intInput = Int(input) else { return false } // 1.
        let filteredInput = Set(String(intInput).map{$0}) // 2.
        
        if filteredInput.count == 3 {   // 3.
            return true
        } else { // 배열의 개수가 3개가 아니면 잘못된 값을 입력한 것
            return false
        }
    }
    
    
    //MARK: Lv2: 입력값 검사
    /* 조건
     1. 입력값이 세글자인지 확인
     2. 숫자가 아닌 값 (compactMap: 옵셔널 값 없앰)
     3. 숫자 0 확인 (filter)
     4. 중복 처리 (Set)
    */
//    func validationInput(input: String) -> Bool {
//        if input.count != 3 { return false } // 1.
//        let filteredInput = Set(input.compactMap{Int(String($0))}.filter{$0 != 0}) // 2, 3, 4
//
//        if filteredInput.count == 3 {
//            return true
//        } else { // 배열의 개수가 3개가 아니면 잘못된 값을 입력한 것
//            print("올바르지 않은 입력 값입니다.")
//            return false
//        }
//    }
}
