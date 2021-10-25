//
//  ViewController.swift
//  TodoList
//
//  Created by cheonsong on 2021/10/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task]() {
        didSet {
            self.saveTasks()
        }
    }
    //strong으로 선언하지 않으면 edit에서 done으로 교체시 메모리에서 해제됨
    @IBOutlet var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks()
    }
    
    //objective-c 랑 호환을 위해
    @objc func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true)
    }

    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        guard !self.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: "할 일을 입력해주세요", preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: {
            [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.tableView.reloadData()
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        //configurationHander : alert에 표시하는 textField를 설정하는 핸들러
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "할 일을 입력해주세요."
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //UserDefaults를 활요해 local에 데이터 저장하기
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title" : $0.title,
                "done" : $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(data, forKey: "tasks")
    }
    
    //UserDefaults를 활용해 local에서 데이터 가져오기
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
        self.tasks = data.compactMap({
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        })
        
    }
    
}

extension ViewController: UITableViewDataSource {
    //두가지 함수는 꼭 구현해주어야함
    //각 섹션에 표시할 행의 개수를 반환하는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    //특정 섹션의 n번째 로우를 그리는데 필요한 셀을 반환하는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //지정된 식별자에 대한 재사용 식별자를 식별하고 표시 -> 큐를 이용해 셀을 재사용, 메모리 낭비를 줄이기위해
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //row는 0...tasks.count
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        if task.done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    //편집 모드에서 삭제버튼을 눌렀을때 버튼이 눌러진 행이 어떤것인지 알려주는 함수
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if self.tasks.isEmpty {
            self.doneButtonTap()
        }
    }
    
    //Edit에서 행을 이동가능하게 해줌
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //sourceIndexPath: 출발 행, destinationIndexPath: 도착 행
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //첫번째 row 가 선택되면 row는 0~~~
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        //선택된 cell만 reload, at: 배열을 같는다는것은 여러셀이 선택되고 리로드될수 있음을 뜻함, with: 행이 업데이트될 떄 애니메이션
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
