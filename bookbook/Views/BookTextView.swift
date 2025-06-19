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

    [dedicationTitle, summaryTitle].forEach({
      $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    })
    dedicationTitle.text = "Dedication"
    summaryTitle.text = "Summary"

    [dedication, summary].forEach({
      $0.font = UIFont.systemFont(ofSize: 14)
      $0.textColor = .darkGray
      $0.numberOfLines = 0
    })
    dedication.text = books[index].dedication
    summary.text = books[index].summary

    //    let infoStack = UIStackView(arrangedSubviews: [
    //      bookTitle, authorStack, releasedStack, pagesStack,
    //    ]).then {
    //      $0.axis = .vertical
    //    }

    let dedicationStack = UIStackView(arrangedSubviews: [dedicationTitle, dedication]).then {
      $0.axis = .vertical
      $0.spacing = 8
    }
    let summaryStack = UIStackView(arrangedSubviews: [summaryTitle, summary]).then {
      $0.axis = .vertical
      $0.spacing = 8
    }

    [dedicationStack, summaryStack].forEach({
      view.addSubview($0)
    })

    dedicationStack.snp.makeConstraints({
      $0.top.equalTo(bookImageStack.snp.bottom).offset(24)
      $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
    })

    summaryStack.snp.makeConstraints({
      $0.top.equalTo(dedicationStack.snp.bottom).offset(24)
      $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
    })
  }
}
