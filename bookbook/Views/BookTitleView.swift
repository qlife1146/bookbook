// 책 소개 뷰
import SnapKit
import UIKit

extension ViewController {
  func titleView(book _: Book) {
    let titleLabel = self.titleLabel
    let seriesButton = self.seriesButton

    titleLabel.text = books[index].title
    // 텍스트 가운데 정렬
    titleLabel.textAlignment = .center
    // 시스템 볼드, 폰트 사이즈 24
    titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    titleLabel.numberOfLines = 2

    seriesButton.setTitle("\(index + 1)", for: .normal)
    // 가운데 정렬
    seriesButton.titleLabel?.textAlignment = .center
    // 폰트 사이즈 16
    seriesButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    // 원형 표시
    seriesButton.layer.cornerRadius = 20
    // 색상 지정
    seriesButton.backgroundColor = .systemBlue

    for item in [titleLabel, seriesButton] {
      view.addSubview(item)
    }

    titleLabel.snp.makeConstraints {
      // leading, trailing = superView 20
      $0.leading.trailing.equalToSuperview().inset(20)
      // top = safeArea
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
    }

    seriesButton.snp.makeConstraints {
      // leading, trailing = superView 20-
      $0.leading.trailing.equalToSuperview().inset(20)
      // 책 제목 top에서 16
      $0.top.equalTo(titleLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.width.height.equalTo(40)
      //      $0.height.equalTo(seriesButton.snp.width)
      //    seriesButton.layoutIfNeeded() // 버튼 레이아웃 강제 계산
      //    seriesButton.layer.cornerRadius = seriesButton.bounds.width / 2
      //    seriesButton.clipsToBounds = true // 경계 바깥 자르기
    }
  }
}
