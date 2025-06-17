// 최상단 뷰
import SnapKit
import Then
import UIKit

extension ViewController {
  func infoView(book: Book) {
    let bookImage = self.bookImage
    let bookTitle = self.bookTitle
    let authorTitle = self.authorTitle
    let author = self.author

    let releaseTitle = self.releaseTitle
    let release = self.release

    let pagesTitle = self.pagesTitle
    let pages = self.pages

    //MARK: Data setting
    bookImage.image = UIImage(named: "harrypotter\(index + 1)")

    bookTitle.text = books[index].title

    authorTitle.text = "Author"

    author.text = books[index].author

    releaseTitle.text = "Released"
    release.text = books[index].releaseDate

    pagesTitle.text = "Pages"
    pages.text = "\(books[index].pages)"

    //MARK: Attribute
    //        bookImage.translatesAutoresizingMaskIntoConstraints = false
    //        bookImage.frame.size.width = 100
    bookImage.contentMode = .scaleAspectFit
    //    bookImage.clipsToBounds = true
    //    bookImage.backgroundColor = .red

    bookTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    bookTitle.numberOfLines = 2

    authorTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)

    releaseTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)

    pagesTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)

    [author, release, pages].forEach({
      $0.font = UIFont.systemFont(ofSize: 14)
      $0.textColor = .gray
    })

    // MARK: Stack Layout
    // 작가 가로 스택
    let authorStack = UIStackView(arrangedSubviews: [authorTitle, author])
    // 발매일 가로 스택
    let releasedStack = UIStackView(arrangedSubviews: [
      releaseTitle, release,
    ])
    // 쪽 수 가로 스택
    let pagesStack = UIStackView(arrangedSubviews: [pagesTitle, pages])

    [authorStack, releasedStack, pagesStack].forEach({
      $0.axis = .horizontal
      //      $0.distribution = .fillProportionally
      $0.alignment = .fill
    })

    // 전체 중 오른쪽 스택
    let infoStack = UIStackView(arrangedSubviews: [
      bookTitle, authorStack, releasedStack, pagesStack,
    ]).then {
      $0.axis = .vertical
    }

    // 전체 스택
    [bookImage, infoStack].forEach({
      bookImageStack.addArrangedSubview($0)
    })
    bookImageStack.axis = .horizontal
    bookImageStack.spacing = 10

    //------------------------
    //|  book |   book info  |
    //| image |--------------|
    //| stack | title | info |
    //------------------------

    // MARK: SnapKit Layout
    view.addSubview(bookImageStack)
    bookImage.snp.makeConstraints({
      $0.width.equalTo(100)
      $0.height.equalTo(bookImage.snp.width).multipliedBy(1.5)
    })
    bookImageStack.snp.makeConstraints {
      $0.top.equalTo(seriesButton.snp.bottom).offset(20)
      $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(5)
    }

    //    let title = [bookAuthorTitle, bookReleaseTitle, bookPages]
    //    let info = [bookAuthor, bookRelease, bookPages]
    //    zip(title, info).forEach{a, b in
    //      a.snp.makeConstraints{
    //        $0.trailing.equalTo(b.snp.leading).offset(-8)
    //      }
    //    }
    //    bookAuthor.setContentCompressionResistancePriority(.init(rawValue: 250), for: .horizontal)

    authorTitle.snp.makeConstraints({
      $0.trailing.equalTo(author.snp.leading).offset(-8)
    })
    releaseTitle.snp.makeConstraints({
      $0.trailing.equalTo(release.snp.leading).offset(-8)
    })
    pagesTitle.snp.makeConstraints({
      $0.trailing.equalTo(pages.snp.leading).offset(-8)
    })
  }
}
