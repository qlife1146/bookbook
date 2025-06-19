// 책 설명 뷰
import SnapKit
import Then
import UIKit

extension ViewController {
  func textView(book: Book) {
    let dedicationTitle = self.dedicationTitle
    let dedication = self.dedication
    let summaryTitle = self.summaryTitle
    let summary = self.summary

    //MARK: Data setting
    dedicationTitle.text = "Dedication"
    summaryTitle.text = "Summary"

    dedication.text = books[index].dedication
    summary.text = books[index].summary
    
    dedication.numberOfLines = 0
    summary.numberOfLines = 0

    //MARK: Attribute
    [dedicationTitle, summaryTitle].forEach({
      $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    })

    [dedication, summary].forEach({
      $0.font = UIFont.systemFont(ofSize: 14)
      $0.textColor = .darkGray
      $0.numberOfLines = 0
    })
  }
}
