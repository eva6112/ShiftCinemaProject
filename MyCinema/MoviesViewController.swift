
import UIKit

struct Movie{
    let title: String
    let imageName: String
}

class MoviesViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private let movies: [Movie] = [
        Movie(title: "Dune", imageName: "dune_poster"),
        Movie(title: "Michael", imageName: "michael_poster"),
        Movie(title: "Jurasic World", imageName: "jurasic_world_poster")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "In cinema"
        view.backgroundColor = .systemBackground
        
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
        
        tableView.separatorStyle = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }
        
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
}
