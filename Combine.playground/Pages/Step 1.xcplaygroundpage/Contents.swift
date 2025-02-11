import UIKit
import Combine

// 1. 간단한 Publisher와 Subscriber 구현
var arr = [10, 20, 30, 40, 50].publisher
arr.map{ $0 * 2 }
    .sink { print($0) }

// 2. Just Publisher 사용
var num = Just(100)
num.map{ $0 + 50 }
    .sink { print($0) }
