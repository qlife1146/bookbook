// 최상단 뷰
import SnapKit
import Then
import UIKit

extension ViewController {
  // TODO: 열림/닫힘, 권 저장
  func infoView(book _: Book) {
    let bookImage = self.bookImage
    let bookTitle = self.bookInfoTitle
    let authorTitle = self.authorTitle
    let author = self.author
    let releaseTitle = self.releaseTitle
    let release = self.release
    let pagesTitle = self.pagesTitle
    let pages = self.pages

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"

    // MARK: Data setting

    func date(at index: Int) -> String {
      if let date = dateFormatter.date(from: books[index].releaseDate) {
        return date.formatted(date: .long, time: .omitted)
      } else {
        return "Format Error"
      }
    }

    // TODO: Layouting
    
    // MARK: 책 표지 이미지 속성

    bookImage.image = UIImage(named: "harrypotter\(index + 1)")
    bookImage.contentMode = .scaleAspectFit
    bookImage.snp.makeConstraints {
      $0.width.equalTo(100)
      $0.height.equalTo(bookImage.snp.width).multipliedBy(1.5)
    }

    // MARK: 책 제목 속성

    bookTitle.text = books[index].title
    bookTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    bookTitle.numberOfLines = 2

    // MARK: 저자 속성

    // 타이틀 속성
    authorTitle.text = "Author"
    authorTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    // 저자 속성
    author.text = books[index].author
    author.font = UIFont.systemFont(ofSize: 18)
    author.textColor = .darkGray

    // MARK: 출간일 속성

    // 타이틀 속성
    releaseTitle.text = "Released"
    releaseTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    // 출간일 속성
    release.text = date(at: index)
    release.font = UIFont.systemFont(ofSize: 14)
    release.textColor = .gray

    // MARK: 페이지 속성

    // 타이틀 속성
    pagesTitle.text = "Pages"
    pagesTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    // 페이지 수 속성
    pages.text = "\(books[index].pages)"
    pages.font = UIFont.systemFont(ofSize: 14)
    pages.textColor = .gray

//    for item in [release, pages] {
//      item.font = UIFont.systemFont(ofSize: 14)
//      item.textColor = .gray
//    }
  }
}
