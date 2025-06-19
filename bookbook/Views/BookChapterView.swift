// 최하단 챕터 뷰
import SnapKit
import Then
import UIKit

extension ViewController {
  func chapterView(book: Book) {
    let chapterTitle = self.chapterTitle
    let chapter = self.chapter

    chapterTitle.text = "Chapters"
    chapter.text = books[index].chapters.map { $0.title }.joined(separator: "\n")
    chapterTitle.font = .systemFont(ofSize: 18, weight: .bold)
    chapter.font = .systemFont(ofSize: 14)
    chapter.textColor = .darkGray
    chapter.numberOfLines = 0
  }
}
