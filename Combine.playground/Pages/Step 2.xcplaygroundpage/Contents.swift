import UIKit
import Combine

// 1. URLSession과 Combine 사용
struct responseDTO: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
    fatalError("잘못된 URL")
}

var cancellables = Set<AnyCancellable>() // 구독을 저장할 변수

func fetchData() -> AnyPublisher<responseDTO, Error> {
    // dataTaskPubliser: 해당 task에 대한 publisher를 반환함
    // 성공 시 데이터 반환, 실패 시 error 반환
    return URLSession.shared.dataTaskPublisher(for: url) // API 요청
        .map {$0.data} // 전달할 데이터 반환
        .decode(type: responseDTO.self, decoder: JSONDecoder()) // 디코딩
        .eraseToAnyPublisher() // 단순한 AnyPublisher 타입으로 바꿔줌
}

fetchData()
    .sink(receiveCompletion: { completion in // receiveCompletion: 모든 값이 방출된 후 마지막 실행, 에러 발생 시 바로 실행됨
        // completion 출력
        print("Completion: \(completion)") // Completion: finished
    }, receiveValue: { result in // receiveValue: 값이 방출될 때마다 실행됨
        // title 출력
        print(result.title)  // delectus aut autem
    })
    .store(in: &cancellables) // 구독을 저장하여 유지 (유지하지 않으면 sink가 실행되기 전에 종료됨


// 2. Time Publisher 사용
let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
var cancellable: AnyCancellable?

cancellable = timer.sink { print($0) }

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    cancellable?.cancel() // 메모리 해제
}
