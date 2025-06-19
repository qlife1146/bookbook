import SnapKit
import UIKit

// contentLayoutGuide, frameLayoutGuide
extension ViewController {
  func textScrollView(book: Book) {
    textScroll.showsHorizontalScrollIndicator = false
    textScroll.showsVerticalScrollIndicator = false

    view.addSubview(textScroll)
    textScroll.addSubview(textContent)
//    [bookImageTitleInfoStack, dediSumStack, chapterStack].forEach({
//      textContent.addSubview($0)
//    })

    textScroll.snp.makeConstraints {
      $0.top.equalTo(seriesButton.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }

    textContent.snp.makeConstraints {
      $0.top.bottom.equalTo(textScroll.contentLayoutGuide)
      $0.leading.trailing.equalTo(textScroll.frameLayoutGuide)
//      $0.edges.equalTo(textScroll.contentLayoutGuide)
//      $0.width.equalTo(textScroll.frameLayoutGuide)
    }
  }
}
