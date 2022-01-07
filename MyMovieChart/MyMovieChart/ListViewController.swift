//
//  ListViewController.swift
//  ProtoTypeCell
//
//  Created by yeoboya_211221_03 on 2022/01/05.
//

import UIKit
import Alamofire

class ListViewController: UITableViewController {
    
    // 테이블 뷰를 구성할 리스트 데이터
    var list = [Movie?]()
    
    // 현재까지 읽어온 페이지 정보
    var page = 1
    
    @IBOutlet weak var moreButton: UIButton!
    
    @IBAction func tapMoreButton(_ sender: UIButton) {
        // 현재 페이지 값에 1 추가
        self.page += 1
        
        callMovieAPI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callMovieAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    func callMovieAPI() {
        // 1.Hoppin API 호출을 위한 URL 생성
        let url: URL! = URL(string: "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=10&genreId=&order=releasedateasc")
        
        // 2.AF를 통해 API 요청
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let res):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: res, options: [])
                    let json = try JSONDecoder().decode(MovieData.self, from: jsonData)
                    self.list.append(contentsOf: json.hoppin.movies.movie)
                    self.tableView.reloadData()
                } catch { }
            case .failure(let e):
                NSLog("\(e)")
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 해당 행에 맞는 데이터 소스를 읽어온다.
        let movie = self.list[indexPath.row]
        
        // 데이터를 담은 셀을 큐에서 가져온 후 리턴한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        // 커스텀 셀의 아울렛변수 통해 변수로 설정
        cell.title?.text = movie?.title!
        cell.desc?.text = movie?.genreNames!
        cell.rating?.text = "\(movie?.ratingAverage! ?? "0")"
        
        return cell
        
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
        
    }
    
}
