import SnapKit
import UIKit

// contentLayoutGuide, frameLayoutGuide
extension ViewController {
  func textScrollView(book _: Book) {
    textScroll.showsHorizontalScrollIndicator = false
    textScroll.showsVerticalScrollIndicator = false

    view.addSubview(textScroll)
    textScroll.addSubview(textContent)
    
    textScroll.snp.makeConstraints {
      $0.top.equalTo(seriesStack.snp.bottom).offset(10)
      $0.leading.trailing.bottom.equalToSuperview()
    }

    textContent.snp.makeConstraints {
      $0.top.bottom.equalTo(textScroll.contentLayoutGuide)
      $0.leading.trailing.equalTo(textScroll.frameLayoutGuide)
    }
  }
}
