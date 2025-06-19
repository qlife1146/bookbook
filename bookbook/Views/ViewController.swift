import SnapKit
import UIKit

class ViewController: UIViewController {
  // MARK: titleView
  var books: [Book] = []
  var index: Int = 0

  let titleLabel = UILabel()
  let seriesButton = UIButton()

  // MARK: infoView
  // 저자 스택
  let authorStack = UIStackView()
  // 발매일 스택
  let releaseStack = UIStackView()
  // 페이지 스택
  let pagesStack = UIStackView()
  // 제목+(저자+발매일+페이지)
  let titleInfoStack = UIStackView()
  // 사진+(제목+(저자+발매일+페이지)) 스택
  let bookImageTitleInfoStack = UIStackView()

  let bookTitle = UILabel()
  let bookImage = UIImageView()

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
  //  let textScrollView = UIScrollView()
  let dedicationTitle = UILabel()
  let dedication = UILabel()
  let summaryTitle = UILabel()
  let summary = UILabel()

  let dedicationStack = UIStackView()
  let summaryStack = UIStackView()
  let dediSumStack = UIStackView()

  // MARK: chapterView
  let chapterTitle = UILabel()
  let chapter = UILabel()
  
  let chapterStack = UIStackView()

  let textScroll = UIScrollView()
  let textContent = UIView()
  
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
        self.chapterView(book: selectedBook)
        self.stackView(book: selectedBook)
        self.textScrollView(book: selectedBook)
      } else {
        print("index 범위 초과")
      }
    }
  }
}
