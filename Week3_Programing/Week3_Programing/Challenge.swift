//
//  Challenge.swift
//  Week3_Programing
//
//  Created by 이수현 on 3/20/25.
//

import Foundation

// MARK: 도전 문제 1.

class Engine {}
class ElectricEngine: Engine {}
class HydrogenEngine: Engine {}

class Car {
    let brand: String // 브랜드
    let model: String // 모델
    let year: String  // 연식
    var engine: Engine // 엔진 커스텀 타입

    init(brand: String, model: String, year: String, engine: Engine) {
        self.brand = brand
        self.model = model
        self.year = year
        self.engine = engine
    }

    func drive(){
        print("Car 주행 중..")
    }

    func stop(){
        print("Car 멈춤")
    }

    func charge(){
        print("Car 충전 중")
    }
}

// Car 를 상속한 ElectricCar: ElectricEngine 타입의 Engine 을 사용
class EletricCar: Car {
    init(brand: String, model: String, year: String, engine: ElectricEngine) {
        super.init(brand: brand, model: model, year: year, engine: engine)
    }
}

// Car 를 상속한 HybridCar: HydrogenEngine 엔진 사용
class HybridCar: Car {
    init(brand: String, model: String, year: String, engine: HydrogenEngine) {
        super.init(brand: brand, model: model, year: year, engine: engine)
    }

    // 엔진을 런타임에 바꿀 수 있는 switchEngine(to:)
    func switchEngine(to newEngine: Engine){
        self.engine = newEngine
    }
}

