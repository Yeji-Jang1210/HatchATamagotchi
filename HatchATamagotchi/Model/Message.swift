//
//  Message.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/7/24.
//

import Foundation
import SwiftyUserDefaults

struct Message {
    
    static var list: [String] {
        let userName = Defaults.user ?? "대장"
        
        return [
            "코드 리뷰 좀 해주세요, \(userName)님!",
            "\(userName)님, 버그 좀 잡아주세요!",
            "그 커피는 제가 마실게요, \(userName)님!",
            "\(userName)님, 저랑 코딩 좀 해요~",
            "API가 또 말썽이에요, \(userName)님!",
            "제 컴파일 좀 도와주세요, \(userName)님!",
            "저도 그 스프린트 회의 참석하고 싶어요, \(userName)님!",
            "재택 근무하면 저랑 더 놀 수 있어요, \(userName)님!",
            "테스트 케이스 추가 좀 해주세요, \(userName)님!",
            "다음 프로젝트 아이디어 생각해봤어요, \(userName)님!",
            "코드가 너무 깔끔해요, \(userName)님!",
            "배포 전에 저도 체크해보고 싶어요, \(userName)님!",
            "버전 관리 좀 해주세요, \(userName)님!",
            "리팩토링은 언제 하나요, \(userName)님?",
            "스택 오버플로에서 해답 찾으셨나요, \(userName)님?",
            "이 기능에 버그가 있어요, \(userName)님!",
            "커밋 메시지 좀 더 자세히 적어주세요, \(userName)님!",
            "제 알고리즘 좀 최적화 해주세요, \(userName)님!",
            "유닛 테스트가 실패했어요, \(userName)님!",
            "데드라인이 얼마 안 남았어요, \(userName)님!"
        ]
    }
}
