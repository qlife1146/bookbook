// 책 소개 뷰
import SnapKit
import UIKit

extension ViewController {
  func titleView(book _: Book) {
    let titleLabel = self.titleLabel
    let seriesButton = self.seriesButton
    let seriesButtons = self.seriesButtons

    titleLabel.text = books[index].title
    titleLabel.textAlignment = .center
    titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    titleLabel.numberOfLines = 2

    seriesButton.setTitle("\(index + 1)", for: .normal)
    seriesButton.titleLabel?.textAlignment = .center
    seriesButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    seriesButton.layer.cornerRadius = 20
    seriesButton.backgroundColor = .systemBlue
    seriesButton.addTarget(self, action: #selector(touchBookBtn), for: .touchUpInside)

//    for item in [titleLabel, seriesButton] {
//      view.addSubview(item)
//    }

//    titleLabel.snp.makeConstraints {
//      // leading, trailing = superView 20
//      $0.leading.trailing.equalToSuperview().inset(20)
//      $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
//    }

    for item in 0 ..< books.count {
      let button = UIButton(type: .system)
      button.setTitle("\(item + 1)", for: .normal)
      button.titleLabel?.textAlignment = .center
      button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
      button.tintColor = .white
      button.snp.makeConstraints {
        $0.width.height.equalTo(40)
      }
      button.layer.cornerRadius = 20
      button.clipsToBounds = true
//      button.backgroundColor = .systemBlue
      button.backgroundColor = index == item ? .systemBlue : .lightGray
      button.tag = item
      button.addTarget(self, action: #selector(touchBookBtn(_:)), for: .touchUpInside)
      seriesButtons.addArrangedSubview(button)
    }
  }

  func updateSeriesButtonColors() {
    for (i, view) in seriesButtons.arrangedSubviews.enumerated() {
      if let button = view as? UIButton {
        button.backgroundColor = (i == index) ? .systemBlue : .lightGray
        button.setTitleColor(.white, for: .normal)
      }
    }
  }
}
