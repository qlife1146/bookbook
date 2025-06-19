import SnapKit
import UIKit

//bookImageStack.addArrangedSubview($0)

extension ViewController {
  func stackView(book: Book) {
    // 저자 스택(authorStack)
    [authorTitle, author].forEach({
      authorStack.addArrangedSubview($0)
    })

    // 발매일 스택(releaseStack)
    [releaseTitle, release].forEach({
      releaseStack.addArrangedSubview($0)
    })

    // 페이지 스택(pageStack)
    [pagesTitle, pages].forEach({
      pagesStack.addArrangedSubview($0)
    })

    // 제목+저자+발매일+페이지 스택(titleInfoStack)
    [bookTitle, authorStack, releaseStack, pagesStack].forEach({
      titleInfoStack.addArrangedSubview($0)
    })

    // 사진+(제목+저자+발매일+페이지) 스택(bookImageTitleInfoStack)
    [bookImage, titleInfoStack].forEach({
      bookImageTitleInfoStack.addArrangedSubview($0)
    })

    // 추천사 스택(dedicationStack)
    [dedicationTitle, dedication].forEach({
      dedicationStack.addArrangedSubview($0)
    })

    // 줄거리 스택(summaryStack)
    [summaryTitle, summary].forEach({
      summaryStack.addArrangedSubview($0)
    })

    // (추천사+줄거리) 스택(dediSumStack)
    [dedicationStack, summaryStack].forEach({
      dediSumStack.addArrangedSubview($0)
    })

    // 챕터 스택
    [chapterTitle, chapter].forEach({
      chapterStack.addArrangedSubview($0)
    })

    // MARK: 레이아웃
    [authorStack, releaseStack, pagesStack].forEach({
      $0.axis = .horizontal
    })
    
    [bookImageTitleInfoStack, dediSumStack, chapterStack].forEach({
      textContent.addSubview($0)
    })

    titleInfoStack.axis = .vertical
    titleInfoStack.spacing = 8
    
    bookImageTitleInfoStack.axis = .horizontal
    bookImageTitleInfoStack.spacing = 16
    
    dedicationStack.axis = .vertical
    dedicationStack.spacing = 8

    summaryStack.axis = .vertical
    summaryStack.spacing = 8

    dediSumStack.axis = .vertical

    chapterStack.axis = .vertical
    chapterStack.spacing = 8

    // MARK: SnapKit 레이아웃
    [authorStack, releaseStack, pagesStack].forEach({
      $0.spacing = 8
    })
    
    let titleLabels = [authorTitle, releaseTitle, pagesTitle]
    let valueLabels = [author, release, pages]
    titleLabels.forEach {
      $0.setContentHuggingPriority(.required, for: .horizontal)
      $0.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    valueLabels.forEach {
      $0.setContentHuggingPriority(.defaultLow, for: .horizontal)
      $0.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
    bookImageTitleInfoStack.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.trailing.equalToSuperview()
    }
    
    dediSumStack.snp.makeConstraints {
      $0.top.equalTo(bookImageTitleInfoStack.snp.bottom)
      $0.leading.trailing.equalToSuperview()
    }
    
    chapterStack.snp.makeConstraints {
      $0.top.equalTo(dediSumStack.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview()
    }
  }
}
