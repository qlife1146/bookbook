import SnapKit
import UIKit

// MARK: - ViewController

class ViewController: UIViewController {
  // MARK: titleView

  var books: [Book] = []
  var index: Int = 0

  let titleLabel: UILabel = .init()
  let seriesButton: UIButton = .init()

  // MARK: infoView

  /// 저자 스택
  let authorStack: UIStackView = .init()
  /// 발매일 스택
  let releaseStack: UIStackView = .init()
  /// 페이지 스택
  let pagesStack: UIStackView = .init()
  /// 제목+(저자+발매일+페이지)
  let titleInfoStack: UIStackView = .init()
  /// 사진+(제목+(저자+발매일+페이지)) 스택
  let bookImageTitleInfoStack: UIStackView = .init()

  let bookTitle: UILabel = .init()
  let bookImage: UIImageView = .init()

  // Stack = 저자명, 발매일 등 타이틀
  // x = jk롤링, 1997년 등 정보
  let bookStackTitle: UILabel = .init()
  let authorTitle: UILabel = .init()
  let author: UILabel = .init()
  let releaseTitle: UILabel = .init()
  let release: UILabel = .init()
  let pagesTitle: UILabel = .init()
  let pages: UILabel = .init()

  let bookImageStack: UIStackView = .init()

  // MARK: textView

  let dedicationTitle: UILabel = .init()
  let dedication: UILabel = .init()
  let summaryTitle: UILabel = .init()
  let summary: UILabel = .init()

  let dedicationStack: UIStackView = .init()
  let summaryStack: UIStackView = .init()
  let dediSumStack: UIStackView = .init()

  // MARK: chapterView

  let chapterTitle: UILabel = .init()
  let chapters: UIStackView = .init()

  let chapterStack: UIStackView = .init()

  let textScroll: UIScrollView = .init()
  let textContent: UIView = .init()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    viewBooks()
  }

  func loadBooks(completion: @escaping ([Book]) -> Void) {
    DataService().loadBooks { result in
      switch result {
      case let .success(books):
        completion(books)
      case let .failure(error):
        //        print("데이터 불러오기 실패: \(error)")
        // data 로드 실패하면 Alert
        DispatchQueue.main.async {
          let alert = UIAlertController(title: "오류", message: "\(error)\n앱을 종료합니다.", preferredStyle: .alert)
          alert.addAction(
            UIAlertAction(title: "확인", style: .default) {
              // 확인 누르면 앱 종료
              _ in
              exit(0)
            })
          self.present(alert, animated: true)
        }
      }
    }
  }

  func viewBooks() {
    loadBooks { [weak self] loadedBooks in
      guard let self = self else { return }
      self.books = loadedBooks

      // index에 해당하는 책으로 topView 구성
      if index < self.books.count {
        let selectedBook = self.books[index]
        self.titleView(book: selectedBook)
        self.infoView(book: selectedBook)
        self.textView(book: selectedBook)
        self.chapterView(book: selectedBook)
        self.stackView(book: selectedBook)
        self.textScrollView(book: selectedBook)
      } else {
        print("index 범위 초과")
      }
    }
  }
}

import SwiftUI

// MARK: - ViewControllerPreview

struct ViewControllerPreview: UIViewControllerRepresentable {
  func makeUIViewController(context _: Context) -> ViewController {
    return ViewController()
  }

  func updateUIViewController(_: ViewController, context _: Context) {}
}

#Preview {
  ViewControllerPreview()
}
