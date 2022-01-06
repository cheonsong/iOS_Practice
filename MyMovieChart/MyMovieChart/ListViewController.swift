//
//  ListViewController.swift
//  ProtoTypeCell
//
//  Created by yeoboya_211221_03 on 2022/01/05.
//

import UIKit

class ListViewController: UITableViewController {
    
    // 테이블 뷰를 구성할 리스트 데이터
    var list = [MovieVO]()
    
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
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=10&genreId=&order=releasedateasc"
        let apiURL: URL! = URL(string:url)
        
        // 2.Rest API 호출
        let apidata = try! Data(contentsOf: apiURL)
        
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "NO Data"
        NSLog("API Result=\( log )")
        
        // 3.JSON 객체를 파싱하여 NSDictionary 객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 4.데이터 구조에 따라 차례대로 캐스팅하며 읽어온다.
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
        
            // 5.Iterator 처리를 하면서 API 데이터를 MovieVO 객체에 저장한다.
            for row in movie {
                // 순회 상수를 NSDictionary 타입으로 캐스팅
                let r = row as! NSDictionary
                
                // 테이블 뷰 리스트를 구성할 데이터 형식
                var mvo = MovieVO()
                
                // movie배열의 각 데이터를 mvo상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                // list배열에 추가
                self.list.append(mvo)
                self.tableView.reloadData()
            }
            // 6.전체 데이터 카운트
            let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
            
            // 7.모든 데이터를 받아왔다면 더보기 버튼을 숨긴 후 알림창 출력
            if self.list.count >= totalCount {
                self.moreButton.isHidden = true
                
                let alert = UIAlertController(title: "알림", message: "마지막 목록입니다", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
                self.present(alert, animated: false)
                
                return
            }
        } catch { }
    }
    
    func getThumbnailImage(_ index: Int) -> UIImage {
        var mvo = self.list[index]
        
        // 메모제이션 기법
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            mvo.thumbnailImage = UIImage(data: try! Data(contentsOf: URL(string: mvo.thumbnail!)!))
            return mvo.thumbnailImage!
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
        cell.title?.text = movie.title
        cell.desc?.text = movie.description
        cell.opendate?.text = movie.opendate
        cell.rating?.text = "\(movie.rating!)"
        
        // 비동기 처리
        DispatchQueue.main.async(execute: {
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        })
        
        return cell
        
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
        
    }
    
}
