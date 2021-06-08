
import AVFoundation
import SnapKit
import UIKit

protocol FeedViewProtocol: AnyObject {
    func showDownloadedPosts(posts: [Post])
}

class FeedViewController: UIViewController, FeedViewProtocol {
    
    private var posts = [Post]() {
        didSet {
            feedTableView.reloadData()
        }
    }
    
    private let defaultFhoto = UIImage(named: "default")
    
    private var targetCellNumber = 7
    
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
    
    let presenter: FeedPresenterProtocol
    
    init(presenter: FeedPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("don't use storyboards!")
    }
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.needPosts()
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
        feedTableView.showsVerticalScrollIndicator = false
        feedTableView.separatorStyle = .none
    }
    
    func showDownloadedPosts(posts: [Post]) {
        self.posts += posts
    }
    
}

//MARK: TableView
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cell.configure(post: posts[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let indexPathForInsertionNewRows = IndexPath(row: targetCellNumber, section: 0)
        if indexPath == indexPathForInsertionNewRows {
            targetCellNumber += 10
            presenter.needPosts()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
