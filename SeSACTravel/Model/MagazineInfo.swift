//
//  MagazineInfo.swift
//
//  Created by Den on 2024/01/08.
//

import Foundation

struct Magazine {
    let title: String
    let subtitle: String
    let photo_image: String
    let date: String
    let link: String
    
    var formattedDate: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyMMdd"
        let date = inputFormatter.date(from: date)
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yy년 MM월 dd일"
        return outputFormatter.string(from: date!)
    }
}

struct MagazineInfo {
  static let magazine: [Magazine] = [
    Magazine(title: "유럽 여행 쇼핑 성지, OOO은 꼭 가세요!", subtitle: "유럽의 인기 쇼핑 명소 총정리", photo_image: "https://images.unsplash.com/photo-1716369415085-4a6876f91840?q=80&w=2828&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", date: "231118", link: "https://triple.guide/articles/265bd919-3f75-4adc-8d5d-c5cf60201bfe"),
    Magazine(title: "현지 MZ가 알려주는 오사카 MZ 인기 스팟", subtitle: "2024 오사카 여행엔 여기!", photo_image: "https://images.unsplash.com/photo-1716404084927-176ee37a9dbe?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", date: "240103", link: "https://triple.guide/articles/d6c5257f-4d52-4a0a-aed2-6773961ee7be"),
    Magazine(title: "2024 NEWS 해외여행, 이렇게 달라졌다!", subtitle: "알고 준비하는 2024 새 여행", photo_image: "https://images.unsplash.com/photo-1715937527911-14a019e0bd95?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", date: "240108", link: "https://triple.guide/articles/997d84b1-25b3-4494-a400-457d1205264a"),
    Magazine(title: "소중한 연차, 이때 쓰세요! 2024 황금연휴 캘린더", subtitle: "미리 세우는 2024년 여행 계획", photo_image: "https://images.unsplash.com/photo-1715646527352-3e9a4e406952?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", date: "231225", link: "https://triple.guide/articles/b373b73a-f7e1-4202-932b-0d8cb188042a"),
    Magazine(title: "팜유 PICK 대만 여행지 '타이중'의 맛과 멋", subtitle: "타이중 매력 스팟은 여기!", photo_image: "https://images.unsplash.com/photo-1716321952175-11aecece3462?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", date: "231222", link: "https://triple.guide/articles/6654b9fc-2235-481a-bdc2-6d4f1bc14237"),
    Magazine(title: "떠나요, 둘이서 낭만이 있는 하와이로", subtitle: "새해 첫 여행, 따듯한 하와이로!", photo_image: "https://i.namu.wiki/i/n7Kj6D6BXGoYr4z7SzJ0RqRyENggrmU-1zMCZcNRJD6ctTp1mw4U6fvnjxkQxJiUu5eMGzxWq4C1BPS1z9YCg7xICNs511ogSJON5UHfxRsVFov4Ao-e-grXaUCxYtYReLtYRQpPpwY8W-RaQ246XQ.webp", date: "231221", link: "https://triple.guide/articles/866cb9d0-22a6-4622-94b2-7bec5f65a87e"),
    Magazine(title: "한 달 살기의 성지, 치앙마이의 재발견", subtitle: "현지인이 말하는 치앙마이의 매력", photo_image: "https://images.unsplash.com/photo-1715559067654-d485ab2618aa?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", date: "231218", link: "https://triple.guide/articles/1283adcc-b9da-4e5f-ab1a-15eaa02162d8"),
    Magazine(title: "태국 여행 전 필수! 대표 음식부터 주문 꿀팁까지", subtitle: "팟타이를 더 맛있게 주문하는 방법?", photo_image: "https://plus.unsplash.com/premium_photo-1664366320037-6cad9e3c6e20?q=80&w=2532&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", date: "231215", link: "https://triple.guide/articles/0ac41b9d-7552-4cd0-b3c4-c1297c163ce5"),
    Magazine(title: "트리플 유저 PICK 2023 인기 장소 TOP 10", subtitle: "새롭게 등록된 BEST 스팟까지!", photo_image: "https://images.unsplash.com/photo-1716364020115-0800909941b9?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", date: "231231", link: "https://triple.guide/articles/db2e37da-3a27-4969-875b-b2c443fb41a7"),
    Magazine(title: "소원을 빌어요 🙏 새해맞이 해돋이 명소 7", subtitle: "배낭톡 in 새해 해돋이", photo_image: "https://images.unsplash.com/photo-1510784722466-f2aa9c52fff6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8JUVEJTk1JUI0JUVCJThGJThCJUVDJTlEJUI0fGVufDB8fDB8fHww", date: "240101", link: "https://triple.guide/content/articles/b040047b-3186-4865-b9d5-07aef77db357"),
    Magazine(title: "크리스마스 분위기 가득! 국내 일루미네이션 명소 ✨", subtitle: "요즘 SNS에서 핫한 장소 총정리", photo_image: "https://images.unsplash.com/photo-1529973625058-a665431328fb?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8JUVEJTgxJUFDJUVCJUE2JUFDJUVDJThBJUE0JUVCJUE3JTg4JUVDJThBJUE0fGVufDB8fDB8fHww", date: "240101", link: "https://triple.guide/content/articles/ca81200f-e367-4fe8-988f-2fa8d0b5c421"),
    Magazine(title: "야시장 천국 '대만 여행' 먹킷리스트", subtitle: "요즘 가장 인기 있는 메뉴는 OO", photo_image: "https://images.unsplash.com/photo-1530014708989-55a898ad9552?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fCVFQiU4QyU4MCVFQiVBNyU4Q3xlbnwwfHwwfHx8MA%3D%3D", date: "240103", link: "https://triple.guide/content/articles/69f887b0-4b87-451f-8859-82c7461858b9"),
    Magazine(title: "핑크빛 바다가 펼쳐지는 환상의 섬, 롬복", subtitle: "잊히지 않는 TV속 그곳!", photo_image: "https://plus.unsplash.com/premium_photo-1671595277425-601080e369db?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8JTA4JUVEJTk1JTkxJUVEJTgxJUFDJTIwJUVCJUIwJTk0JUVCJThCJUE0fGVufDB8fDB8fHww", date: "240101", link: "https://triple.guide/content/articles/8c4cded5-ff1e-4898-b884-c7b9f84fd5d8"),
    Magazine(title: "여행 고수가 알려주는 새벽 비행기 이용 꿀팁", subtitle: "이제 공항에서 시간 때울 걱정 끝!", photo_image: "https://images.unsplash.com/photo-1436491865332-7a61a109cc05?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8JUVCJUI5JTg0JUVEJTk2JTg5JUVBJUI4JUIwfGVufDB8fDB8fHww", date: "240105", link: "https://triple.guide/content/articles/791578f3-95d7-4300-a51f-6dff48db5d55")
  ]
}
