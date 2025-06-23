import SnapKit
import UIKit

// MARK: - ViewController

enum DefaultsKey {
  static let lastIndex = "lastIndex"
}

class ViewController: UIViewController {
  // MARK: titleView

  var books: [Book] = []
  var index: Int = 0 {
    didSet {
      updateData()
    }
  }

  var isExpanded: Bool = false {
    didSet {
      summaryUpdate()
      UserDefaults.standard.set(isExpanded, forKey: isExpandedKey(for: index))
    }
  }

  let seriesStack: UIStackView = .init()
  let titleLabel: UILabel = .init()
  let seriesButton: UIButton = .init()
  let seriesButtons: UIStackView = .init()

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

  let bookInfoTitle: UILabel = .init()
  let bookImage: UIImageView = .init()

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
  let summaryButton: UIButton = .init()
  let dedicationStack: UIStackView = .init()
  let summaryStack: UIStackView = .init()
  let dediSumStack: UIStackView = .init()

  // MARK: chapterView

  let chapterTitle: UILabel = .init()
  let chapters: UIStackView = .init()
  let chapterStack: UIStackView = .init()

  let textScroll: UIScrollView = .init()
  let textContent: UIView = .init()
  
  func isExpandedKey(for index: Int) -> String {
    return "isExpanded\(index)"
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    viewBooks()
    index = UserDefaults.standard.integer(forKey: DefaultsKey.lastIndex)
    isExpanded = UserDefaults.standard.bool(forKey: isExpandedKey(for: index))
    summurrayButtonAction()
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

  func updateData() {
    titleLabel.text = books[index].title
    updateSeriesButtonColors()
    bookImage.image = UIImage(named: "harrypotter\(index + 1)")
    author.text = books[index].author
    release.text = books[index].releaseDate
    pages.text = "\(books[index].pages)"
    dedication.text = books[index].dedication
//    summary.text = books[index].summary
    summaryUpdate()
    chaptersSet(index: index)
  }

  func isExpendedKey(for index: Int) -> String {
    return "isExpanded\(index)"
  }
  
  @objc func touchBookBtn(_ sender: UIButton) {
    let selected = sender.tag
    index = selected
//    print("\(index + 1), Button was tapped!"ㅍ
//    print(selected, index)
  }
}
