import SnapKit
import UIKit

class ViewController: UIViewController {
  // MARK: titleView
  var books: [Book] = []
  var index: Int = 0

  let titleLabel = UILabel()
  let seriesButton = UIButton()

  // MARK: infoView
  // TitleStack = 스택 그 자체
//  let bookImageTitleStack = UIStackView()
//  let bookInfoTitleStack = UIStackView()
//  let bookAuthorTitleStack = UIStackView()
//  let bookReleasedTitleStack = UIStackView()
//  let bookPagesTitleStack = UIStackView()

  let bookImage = UIImageView()
  let bookTitle = UILabel()

  // Stack = 저자명, 발매일 등 타이틀
  // x = jk롤링, 1997년 등 정보
  let bookStackTitle = UILabel()
  let authorTitle = UILabel()
  let author = UILabel()
  let releaseTitle = UILabel()
  let release = UILabel()
  let pagesTitle = UILabel()
  let pages = UILabel()
  
  let bookImageStack = UIStackView()
  // MARK: textView
  let dedication = UILabel()
  let dedicationTitle = UILabel()
  let summary = UILabel()
  let summaryTitle = UILabel()

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
        print("데이터 불러오기 실패: \(error)")
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
      } else {
        print("index 범위 초과")
      }
    }
  }
}
