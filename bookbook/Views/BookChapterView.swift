// 최하단 챕터 뷰
import SnapKit
import Then
import UIKit

extension ViewController {
  func chapterView(book _: Book) {
    let chapterTitle = self.chapterTitle
    let chapters = self.chapters

    // MARK: 목차 속성

    // 타이틀 속성
    chapterTitle.text = "Chapters"
    chapterTitle.font = .systemFont(ofSize: 18, weight: .bold)

    // 내용 속성
    for i in books[index].chapters {
      let label = UILabel()
      label.text = "\(i.title)"
      label.font = .systemFont(ofSize: 14)
      label.textColor = .darkGray
      label.numberOfLines = 0
      chapters.addArrangedSubview(label)
    }
  }
  func chaptersSet(index: Int) {
    for view in chapters.arrangedSubviews {
      chapters.removeArrangedSubview(view)
      view.removeFromSuperview()
    }
    for i in books[index].chapters {
      let label = UILabel()
      label.text = "\(i.title)"
      label.font = .systemFont(ofSize: 14)
      label.textColor = .darkGray
      label.numberOfLines = 0
      chapters.addArrangedSubview(label)
    }
  }
}
