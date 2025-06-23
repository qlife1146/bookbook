// 책 설명 뷰
import SnapKit
import Then
import UIKit

extension ViewController {
  func textView(book _: Book) {
    let dedicationTitle = self.dedicationTitle
    let dedication = self.dedication
    let summaryTitle = self.summaryTitle
    let isExpanded = UserDefaults.standard.bool(forKey: isExpandedKey(for: index))

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
//    print(books[index].summary.count)
    summaryUpdate()

    summaryButton.setTitle(isExpanded ? "접기" : "더 보기", for: .normal)
    summaryButton.setTitleColor(.systemBlue, for: .normal)
    summaryButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
  }

  func summaryUpdate() {
    let isExpanded = UserDefaults.standard.bool(forKey: isExpandedKey(for: index))
    let summaryText = books[index].summary

    if summaryText.count >= 450 {
      summaryButton.isHidden = false
      if !isExpanded {
        summary.text = summaryText.prefix(450) + "..."
        summaryButton.setTitle("더 보기", for: .normal)
      } else {
        summary.text = summaryText
        summaryButton.setTitle("접기", for: .normal)
      }
    } else if summaryText.count < 450 {
      summaryButton.isHidden = true
      summary.text = summaryText
    }

    summary.font = UIFont.systemFont(ofSize: 14)
    summary.textColor = .darkGray
    summary.numberOfLines = 0
  }

  func summurrayButtonAction() {
    summaryButton.addTarget(self, action: #selector(summaryButtonTapped), for: .touchUpInside)
  }

  @objc func summaryButtonTapped() {
//    print("tapped, \(isExpanded)")
    let key = isExpandedKey(for: index)
    let isExpanded = UserDefaults.standard.bool(forKey: key)
    let newState = !isExpanded

    UserDefaults.standard.set(newState, forKey: key)
    summaryUpdate()
  }
}
