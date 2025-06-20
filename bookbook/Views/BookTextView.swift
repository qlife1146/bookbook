// 책 설명 뷰
import SnapKit
import Then
import UIKit

extension ViewController {
  func textView(book _: Book) {
    let dedicationTitle = self.dedicationTitle
    let dedication = self.dedication
    let summaryTitle = self.summaryTitle
    let summary = self.summary

    // MARK: Dedication 속성

    // 타이틀 속성
    dedicationTitle.text = "Dedication"
    dedicationTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    // 헌정사 내용 속성
    dedication.text = books[index].dedication
    dedication.font = UIFont.systemFont(ofSize: 14)
    dedication.textColor = .darkGray
    dedication.numberOfLines = 0

    // MARK: Summary 속성

    // 타이틀 속성
    summaryTitle.text = "Summary"
    summaryTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    // 요약 속성
    summary.text = books[index].summary
    summary.font = UIFont.systemFont(ofSize: 14)
    summary.textColor = .darkGray
    summary.numberOfLines = 0

//    for item in [dedicationTitle, summaryTitle] {
//      item.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//    }
//
//    for item in [dedication, summary] {
//      item.font = UIFont.systemFont(ofSize: 14)
//      item.textColor = .darkGray
//      item.numberOfLines = 0
//    }
  }
}
