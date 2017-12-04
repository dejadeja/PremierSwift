import UIKit

class MoviesViewController: UIViewController {
    //MARK: - Properties
    private lazy var moviesTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MovieTableViewCell.self))
        return tableView
    }()
    
    private var movies: [[String: Any]] = []
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
        
        let moviesURL = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=e4f9e61f6ffd66639d33d3dde7e3159b")
        URLSession.shared.dataTask(with: moviesURL!) { (responseData, _, _) in
            if let data = responseData {
                let JSON = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue:0)) as! [String: Any]
                self.movies = JSON["results"] as! [[String: Any]]
                self.moviesTableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
            }
        }.resume()
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
}

extension MoviesViewController: UITableViewDelegate { }

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesDataSource.numberOfMovies
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.movieTitle.text = moviesDataSource.movieTitle(atIndex: indexPath.row)
        cell.movieOverview.text = moviesDataSource.movieOverView(atIndex: indexPath.row)
        //cell.movieThumbnail.image = moviesDataSource.movieThumbnailImage(atIndex: indexPath.row)
        return cell
    }
}
