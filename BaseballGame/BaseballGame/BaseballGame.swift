//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 이수현 on 3/10/25.
//

import Foundation

struct BaseballGame {
    // 정답
    var answer: [String]?
    
    // 게임 시작
    mutating func start() {
        self.answer = createAnswer()
        print(answer ?? "정답 생성 실패")
    }
    
    // 정답 숫자 랜덤 생성
    func createAnswer() -> [String] {
        var numSet: Set<String> = [] // Set은 중복 허용 안 함, 순서 없음
        while numSet.count < 3 { // Set의 개수가 3개가 될 때까지 랜덤 숫자 추가
            numSet.insert(String(Int.random(in: 1...9))) // 1~9까지 랜덤 숫자를 생성하여 numSet에 추가 (Set은 중복 허용 안 하므로 중복 방지)
        }

        return Array(numSet)
    }

}
