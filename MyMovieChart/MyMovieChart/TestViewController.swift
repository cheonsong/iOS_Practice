//
//  TestViewController.swift
//  MyMovieChart
//
//  Created by yeoboya_211221_03 on 2022/01/06.
//

import UIKit
import Alamofire

class TestViewController: UIViewController {

    var list = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=1&genreId=&order=releasedateasc"
        AF.request(URL(string: url)!).responseJSON { (response) in
            switch response.result {
            case .success(let res):
                do {
                    print(res)
                    let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                    let json = try JSONDecoder().decode(TestMovieVO.self, from: jsonData)
                    print(json.hoppin.movies.movie)
                } catch { }
            case .failure(_):
                NSLog("실패")
            }
        }
    }
}

extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mvo = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = mvo.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
}

extension TestViewController: UITableViewDelegate {
    
}
