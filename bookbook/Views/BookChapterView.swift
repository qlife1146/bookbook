// 최하단 챕터 뷰
import SnapKit
import Then
import UIKit

extension ViewController {
  func chapterView(book _: Book) {
    let chapterTitle = self.chapterTitle
    let chapter = self.chapter

    // MARK: 목차 속성

    // 타이틀 속성
    chapterTitle.text = "Chapters"
    chapterTitle.font = .systemFont(ofSize: 18, weight: .bold)
    // 내용 속성
    chapter.text = books[index].chapters.map { $0.title }.joined(separator: "\n")
    chapter.font = .systemFont(ofSize: 14)
    chapter.textColor = .darkGray
    chapter.numberOfLines = 0
    // TODO: 챕터 간격
  }
}
