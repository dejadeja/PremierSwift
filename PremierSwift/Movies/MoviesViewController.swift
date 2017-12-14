import UIKit
import AlamofireImage

class MoviesViewController: UIViewController {
    //MARK: - Properties
    private lazy var moviesTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 275
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MovieTableViewCell.self))
        return tableView
    }()
    
    private var moviesDataSource: MovieDataSource
    
    //MARK: - Initialiser
    init(dataSource: MovieDataSource) {
        moviesDataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        constrainTableViewToEdges()
        
    }
    
    //MARK: - Configure NavigationBar
    private func configureNavigationBar() {
        title = "Top Movies"
    }
    
    //MARK: - Constraints
    private func constrainTableViewToEdges() {
        self.view.addSubview(moviesTableView)
        moviesTableView.translatesAutoresizingMaskIntoConstraints = false
        moviesTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        moviesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        moviesTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        moviesTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
     }
    
    //MARK: - Actions
    public func presentDetailViewController(dataSource: MovieDataSource, atIndex index: Int) {
       
    }
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesDataSource.numberOfMovies
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MovieTableViewCell.self), for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.movieTitle.text = moviesDataSource.movieTitle(atIndex: indexPath.row)
        cell.movieOverview.text = moviesDataSource.movieOverView(atIndex: indexPath.row)
        cell.movieThumbnail.af_setImage(withURL: moviesDataSource.movieThumbnailImageURL(atIndex: indexPath.row)!)
        cell.delegate = self
        return cell
    }
}

//MARK: - The image view must be selectable not the cell
extension MoviesViewController: MovieTableCellDetailDelegate {
    func didSelectImageView(cell: MovieTableViewCell) {
        guard let index = moviesTableView.indexPath(for: cell) else {
            return
        }
        
        let selectedIndex = index.row
        presentDetailViewController(dataSource: moviesDataSource, atIndex: selectedIndex)
    }
}
