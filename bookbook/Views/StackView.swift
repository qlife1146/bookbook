import SnapKit
import UIKit

// bookImageStack.addArrangedSubview($0)

extension ViewController {
  func stackView(book _: Book) {
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
    for item in [bookTitle, authorStack, releaseStack, pagesStack] {
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

    for item in [bookImageTitleInfoStack, dediSumStack, chapterStack] {
      textContent.addSubview(item)
    }
    
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
      $0.leading.trailing.equalToSuperview().inset(20)
    }

    // 챕터 스택

    for item in [chapterTitle, chapters] {
      chapterStack.addArrangedSubview(item)
    }
    chapters.spacing = 8
    chapters.axis = .vertical
    chapterStack.axis = .vertical
    chapterStack.spacing = 8

    chapterStack.snp.makeConstraints {
      $0.top.equalTo(dediSumStack.snp.bottom).offset(24)
      $0.leading.trailing.equalToSuperview().inset(20)
      $0.bottom.equalToSuperview()
    }
    
    // 총 스택


  }
}
