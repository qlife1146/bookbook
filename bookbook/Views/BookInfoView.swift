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
    // TODO: 날짜 포맷팅
    release.text = books[index].releaseDate
    pagesTitle.text = "Pages"
    pages.text = "\(books[index].pages)"

    //MARK: Attribute
    bookImage.contentMode = .scaleAspectFit

    bookTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    bookTitle.numberOfLines = 2

    authorTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    releaseTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    pagesTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)

    [author, release, pages].forEach({
      $0.font = UIFont.systemFont(ofSize: 14)
      $0.textColor = .gray
    })
    
    bookImage.snp.makeConstraints({
      $0.width.equalTo(100)
      $0.height.equalTo(bookImage.snp.width).multipliedBy(1.5)
    })
  }
}
