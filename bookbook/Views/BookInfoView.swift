import SnapKit
import UIKit

extension ViewController {
  func midView(book: Book) {
    let bookImage = self.bookImage
    let bookTitle = self.bookTitle
    let bookAuthorTitle = self.bookAuthorTitle
    let bookAuthor = self.bookAuthor

    let bookReleaseTitle = self.bookReleaseTitle
    let bookRelease = self.bookRelease

    let bookPagesTitle = self.bookPagesTitle
    let bookPages = self.bookPages

    //MARK: Data setting

    bookImage.image = UIImage(named: "harrypotter\(books[index+1]).jpg")

    bookTitle.text = books[index].title

    bookAuthorTitle.text = "Author"

    bookAuthor.text = books[index].author

    bookReleaseTitle.text = "Released"
    bookRelease.text = books[index].releaseDate

    bookPagesTitle.text = "Pages"
    bookPages.text = "\(books[index].pages)"

    //MARK: Attribute
    //        bookImage.translatesAutoresizingMaskIntoConstraints = false
    //        bookImage.frame.size.width = 100
    bookImage.contentMode = .scaleAspectFit
    //    bookImage.clipsToBounds = true
    bookImage.backgroundColor = .red

    bookTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    bookTitle.numberOfLines = 2
    
    bookAuthorTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    bookAuthor.font = UIFont.systemFont(ofSize: 14)
    bookAuthor.textColor = .gray
    
    bookReleaseTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    bookRelease.font = UIFont.systemFont(ofSize: 14)
    bookRelease.textColor = .gray
    
    bookPagesTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    bookPages.font = UIFont.systemFont(ofSize: 14)
    bookPages.textColor = .gray

    // MARK: Stack Layout
    let bookAuthorStack = UIStackView(arrangedSubviews: [bookAuthorTitle, bookAuthor])
    let bookReleasedStack = UIStackView(arrangedSubviews: [
      bookReleaseTitle, bookRelease,
    ])
    let bookPagesStack = UIStackView(arrangedSubviews: [bookPagesTitle, bookPages])

    [bookAuthorStack, bookReleasedStack, bookPagesStack].forEach({
      $0.axis = .horizontal
    })

    let bookInfoStack = UIStackView(arrangedSubviews: [
      bookTitle, bookAuthorStack, bookReleasedStack, bookPagesStack,
    ])
    bookInfoStack.axis = .vertical

    let bookImageStack = UIStackView(arrangedSubviews: [bookImage, bookInfoStack])
    bookImageStack.axis = .horizontal

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
//      $0.trailing.equalTo(bookImage.snp.leading).offset(-10)
    }
    
//    let title = [bookAuthorTitle, bookReleaseTitle, bookPages]
//    let info = [bookAuthor, bookRelease, bookPages]
//    zip(title, info).forEach{a, b in
//      a.snp.makeConstraints{
//        $0.trailing.equalTo(b.snp.leading).offset(-8)
//      }
//    }
    bookAuthorTitle.snp.makeConstraints({
      $0.trailing.equalTo(bookAuthor.snp.leading).offset(-8)
    })
    bookRelease.snp.makeConstraints({
      $0.leading.equalTo(bookRelease.snp.trailing).offset(8)
    })
    bookPages.snp.makeConstraints({
      $0.leading.equalTo(bookPages.snp.trailing).offset(8)
    })
  }
}
