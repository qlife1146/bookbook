import SnapKit
import UIKit

extension ViewController {
  func topView(book: Book) {
    let bookTitleLabel = self.bookTitleLabel
    let seriesButton = self.seriesButton

    bookTitleLabel.text = books[index].title
    bookTitleLabel.textAlignment = .center
    bookTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
    bookTitleLabel.numberOfLines = 2

    seriesButton.setTitle("1", for: .normal)
    seriesButton.titleLabel?.textAlignment = .center
    seriesButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    seriesButton.backgroundColor = .systemBlue

    [bookTitleLabel, seriesButton].forEach({
      view.addSubview($0)
    })
    bookTitleLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
      $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
    }
    seriesButton.snp.makeConstraints({
      $0.top.equalTo(bookTitleLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.height.equalTo(seriesButton.snp.width)
    })
    seriesButton.layoutIfNeeded()  // 버튼 레이아웃 강제 계산
    seriesButton.layer.cornerRadius = seriesButton.bounds.width / 2
    seriesButton.clipsToBounds = true  // 경계 바깥 자르기
  }
}
