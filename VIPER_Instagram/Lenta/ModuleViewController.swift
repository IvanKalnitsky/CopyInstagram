

import UIKit
//import SnapKit
import AVFoundation

protocol ViewProtocol: class {
    func showDownloadedNumbers(newNumbers: [Int])
}

class ModuleViewController: UIViewController, ViewProtocol {
    
    private var feedTableView = UITableView()
    
    private var numbers = [Int]()
  
    let presenter: PresenterProtocol
    
    init(presenter: PresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("don't use storyboards!")
    }

    //MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.addNumbers()
        initialize()
    }

    private func initialize() {
        //MARK: - SetupTableView
        feedTableView = UITableView(frame: view.bounds, style: .plain)
        feedTableView.dataSource = self
        feedTableView.delegate = self
        feedTableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "cell")
        feedTableView.rowHeight = UITableView.automaticDimension
        feedTableView.estimatedRowHeight = 200
        self.view.addSubview(feedTableView)
    }
    
    func showDownloadedNumbers(newNumbers: [Int]) {
        self.numbers = newNumbers
    }
}

extension ModuleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = "\(numbers[indexPath.row])"
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
       return cell
    }
    
    
}
