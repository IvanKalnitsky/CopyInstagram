

import UIKit
//import SnapKit
import AVFoundation

protocol FeedViewProtocol: AnyObject {
    func showDownloadedPhotos(photos: [String])
}

class FeedViewController: UIViewController, FeedViewProtocol {
    
    private var photos = [String]()
    
    private let defaultFhoto = UIImage(named: "default")
    
    let presenter: FeedPresenterProtocol
    
    //MARK: PaginatorProperties
    private var targetCellNumber = 0
    private let numberOfPostsToAdd = 1
    
    init(presenter: FeedPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("don't use storyboards!")
    }
    
    //MARK: CreateViews
    
    private var feedTableView = UITableView()
    
    private var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var instaButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.logo, for: .normal)
        return button
    }()
    
    private var messageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.message, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
        

    //MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.addPhotos(number: numberOfPostsToAdd)
        initialize()
    }

    private func initialize() {
        self.view.backgroundColor = .white
        //MARK: - SetupTopView
        
        self.view.addSubview(topView)
        topView.snp.makeConstraints { maker in
            maker.left.top.right.equalToSuperview()
            maker.height.equalTo(100)
        }
        
        topView.addSubview(instaButton)
        instaButton.snp.makeConstraints { maker in
            maker.bottom.equalToSuperview().inset(10)
            maker.left.equalToSuperview().inset(20)
            maker.height.equalTo(40)
            maker.width.equalTo(120)
        }
        
        topView.addSubview(messageButton)
        messageButton.snp.makeConstraints { maker in
            maker.right.equalToSuperview().inset(10)
            maker.height.width.equalTo(30)
            maker.bottom.equalToSuperview().inset(15)
        }
        
        //MARK: - SetupTableView
        self.view.addSubview(feedTableView)
        feedTableView.snp.makeConstraints { maker in
            maker.top.equalTo(topView.snp.bottom)
            maker.left.right.bottom.equalToSuperview()
        }
        feedTableView.dataSource = self
        feedTableView.delegate = self
        feedTableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "cell")
       
    }
    
    func showDownloadedPhotos(photos: [String]) {
      print("In View --- photosCount = \(photos.count)")
        let oldValue = self.photos.count
        self.photos += photos
        var indexPaths = [IndexPath]()
        for row in oldValue..<self.photos.count {
            indexPaths.append(IndexPath(row: row, section: 0))
        }
        self.feedTableView.insertRows(at: indexPaths, with: .automatic)
//        self.photos = photos
//        feedTableView.reloadData()
    }
    
}

//MARK: TableView
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("TableView --- photosCount = \(photos.count)")
       return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cell.getImage(from: photos[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let indexPathForInsertionNewRows = IndexPath(row: targetCellNumber, section: 0)
        if indexPath == indexPathForInsertionNewRows {
        targetCellNumber += numberOfPostsToAdd
        presenter.addPhotos(number: numberOfPostsToAdd)
        }
    }
}
