// 책 소개 뷰
import SnapKit
import UIKit

extension ViewController {
  func titleView(book: Book) {
    let titleLabel = self.titleLabel
    let seriesButton = self.seriesButton

    titleLabel.text = books[index].title
    titleLabel.textAlignment = .center
    titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
    titleLabel.numberOfLines = 2

    seriesButton.setTitle("1", for: .normal)
    seriesButton.titleLabel?.textAlignment = .center
    seriesButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    seriesButton.backgroundColor = .systemBlue

    [titleLabel, seriesButton].forEach({
      view.addSubview($0)
    })
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
      $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
    }
    seriesButton.snp.makeConstraints({
      $0.top.equalTo(titleLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.height.equalTo(seriesButton.snp.width)
    })
    seriesButton.layoutIfNeeded()  // 버튼 레이아웃 강제 계산
    seriesButton.layer.cornerRadius = seriesButton.bounds.width / 2
    seriesButton.clipsToBounds = true  // 경계 바깥 자르기
  }
}
