//
//  ViewController.swift
//  bookbook
//
//  Created by Luca Park on 6/12/25.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    let testLabel = UILabel()
    let bookTitleLabel = UILabel()
    let seriesButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        lv1View()
        //                test()
        //                jsonDebug()
    }
    
    func test() {
        testLabel.text = "gsdogdsoghodfigfd"
        testLabel.textColor = .red
        
        view.addSubview(testLabel)
        testLabel.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func lv1View() {
        DataService().loadBooks { result in
            switch result {
            case .success:
                DataService().loadBooks { [self] result in
                    switch result {
                    case let .success(books):
                        let bookTitleLabel = self.bookTitleLabel
                        let seriesButton = self.seriesButton
                        
                        bookTitleLabel.text = books[0].title
                        bookTitleLabel.textAlignment = .center
                        bookTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
                        bookTitleLabel.numberOfLines = 2
                        
                        seriesButton.setTitle("1", for: .normal)
                        seriesButton.titleLabel?.textAlignment = .center
                        seriesButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
                        seriesButton.backgroundColor = .systemBlue
                        
                        [bookTitleLabel, seriesButton].forEach({
                            view.addSubview($0)
                        })
                        bookTitleLabel.snp.makeConstraints {
                            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
                            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
                        }
                        seriesButton.snp.makeConstraints({
                            $0.top.equalTo(bookTitleLabel.snp.bottom).offset(16)
                            $0.centerX.equalToSuperview()
                            $0.height.equalTo(seriesButton.snp.width)
                        })
                        seriesButton.layoutIfNeeded()       // 버튼 레이아웃 강제 계산
                        seriesButton.layer.cornerRadius = seriesButton.bounds.width / 2
                        seriesButton.clipsToBounds = true   // 경계 바깥 자르기
                        
                    case let .failure(error):
                        print("❌ 데이터 불러오기 실패: \(error)")
                    }
                }
            case let .failure(error):
                print("❌ 데이터 불러오기 실패: \(error)")
            }
        }
    }
    
}
