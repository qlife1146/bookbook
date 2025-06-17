import UIKit

struct Book: Decodable {
    let title: String
    let author: String
    let pages: Int
    let releaseDate: String
    let dedication: String
    let summary: String
    let wiki: String
    let chapters: [Chapter]

    enum CodingKeys: String, CodingKey {
        case title, author, pages, dedication, summary, wiki, chapters
        case releaseDate = "release_date"
    }
}

struct Chapter: Decodable {
    let title: String
}

struct BookResponse: Decodable {
    let data: [BookContainer]

    struct BookContainer: Decodable {
        let attributes: Book
    }
}
