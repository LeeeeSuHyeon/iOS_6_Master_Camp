import UIKit

// 1. 비동기 데이터 처리
DispatchQueue.global().async {
    for i in 1...5 {
        print(i)
    }
    
    DispatchQueue.main.async {
        print("UI 업데이트 완료")
    }
}


// 2. 네트워크 시뮬레이션
DispatchQueue.global().async {
    // 네트워크 요청을 시뮬레이션
    // URLSession.shared.dataTask(with: <#T##URLRequest#>)
    sleep(3) // 3초간 대기
    print("데이터 로드 중")
    
    DispatchQueue.main.async {
        print("데이터 로드 완료")
    }
}
