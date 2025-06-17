import UIKit

func jsonDebug() {
    DataService().loadBooks { result in
        switch result {
        case let .success(books):
            print("총 \(books.count)권의 책을 불러왔습니다.")
            for book in books {
                print("📘 \(book.title) - 저자: \(book.author)")
                print("  챕터 수: \(book.chapters.count)")
            }
        case let .failure(error):
            print("❌ 데이터 불러오기 실패: \(error)")
        }
    }
}
