import SnapKit
import UIKit

// bookImageStack.addArrangedSubview($0)

extension ViewController {
  func stackView(book _: Book) {
    // 최상단 스택(seriesStack)
    for item in [titleLabel, seriesButtons] {
      seriesStack.addArrangedSubview(item)
    }
    seriesStack.spacing = 16

    // 저자 스택(authorStack)
    for item in [authorTitle, author] {
      authorStack.addArrangedSubview(item)
    }

    // 발매일 스택(releaseStack)
    for item in [releaseTitle, release] {
      releaseStack.addArrangedSubview(item)
    }

    // 페이지 스택(pageStack)
    for item in [pagesTitle, pages] {
      pagesStack.addArrangedSubview(item)
    }
    let titleLabels = [authorTitle, releaseTitle, pagesTitle]
    let valueLabels = [author, release, pages]

    for titleLabel in titleLabels {
      titleLabel.setContentHuggingPriority(.required, for: .horizontal)
      titleLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }

    for valueLabel in valueLabels {
      valueLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
      valueLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }

    for item in [authorStack, releaseStack, pagesStack] {
      item.axis = .horizontal
      item.spacing = 8
    }

    // 제목+저자+발매일+페이지 스택(titleInfoStack)
    for item in [bookInfoTitle, authorStack, releaseStack, pagesStack] {
      titleInfoStack.addArrangedSubview(item)
    }
    titleInfoStack.axis = .vertical
    titleInfoStack.spacing = 8

    // 사진+(제목+저자+발매일+페이지) 스택(bookImageTitleInfoStack)
    for item in [bookImage, titleInfoStack] {
      bookImageTitleInfoStack.addArrangedSubview(item)
    }
    bookImageTitleInfoStack.axis = .horizontal
    bookImageTitleInfoStack.spacing = 16

    // 이게 진짜 중요. 레이아웃 단계보다 위에 있어야 그려짐. 즉, 일단 판이 깔려야 조정할 수 있음
    view.addSubview(seriesStack)
    for item in [bookImageTitleInfoStack, dediSumStack, chapterStack] {
      textContent.addSubview(item)
    }

    // 책 최상단 스택(seriesStack)
    seriesButtons.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
//      $0.width.height.equalTo(40)
    }
    seriesButtons.distribution = .equalCentering
//    seriesButtons.alignment = .center

    seriesStack.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
      $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
    }
    seriesStack.axis = .vertical

    // 책 정보 스택(bookImageTitleInfoStack)
    bookImageTitleInfoStack.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.trailing.equalTo(textContent.safeAreaLayoutGuide).inset(20)
    }

    // 추천사 스택(dedicationStack)
    for item in [dedicationTitle, dedication] {
      dedicationStack.addArrangedSubview(item)
    }
    dedicationStack.axis = .vertical
    dedicationStack.spacing = 8

    // 줄거리 스택(summaryStack)
    for item in [summaryTitle, summary] {
      summaryStack.addArrangedSubview(item)
    }
    summaryStack.axis = .vertical
    summaryStack.spacing = 8

    // (추천사+줄거리) 스택(dediSumStack)
    for item in [dedicationStack, summaryStack] {
      dediSumStack.addArrangedSubview(item)
    }
    dediSumStack.axis = .vertical
    dediSumStack.spacing = 24

    dediSumStack.snp.makeConstraints {
      $0.top.equalTo(bookImageTitleInfoStack.snp.bottom).offset(24)
      $0.leading.trailing.equalTo(textContent.safeAreaLayoutGuide).inset(20)
    }

    // 챕터 스택(chapterStack)
    for item in [chapterTitle, chapters] {
      chapterStack.addArrangedSubview(item)
    }
    chapters.spacing = 8
    chapters.axis = .vertical
    chapterStack.axis = .vertical
    chapterStack.spacing = 8

    chapterStack.snp.makeConstraints {
      $0.top.equalTo(dediSumStack.snp.bottom).offset(24)
      $0.leading.trailing.equalTo(textContent.safeAreaLayoutGuide).inset(20)
      $0.bottom.equalToSuperview()
    }
  }
}
