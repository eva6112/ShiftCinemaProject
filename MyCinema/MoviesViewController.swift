
import UIKit

struct Movie{
    let title: String
    let imageName: String
}

class MoviesViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private let trendMovies: [Movie] = [
        Movie(title: "The drama", imageName: "drama_poster"),
        Movie(title: "Dune", imageName: "dune_poster"),
        Movie(title: "Wuthering Heights", imageName: "wuthering_heights_poster")
    ]
    
    private let regularMovies: [Movie] = [
        Movie(title: "Michael", imageName: "michael_poster"),
        Movie(title: "The housemaid", imageName: "housemaid_poster"),
        Movie(title: "The devil wears Prada", imageName: "devil_poster")
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
        tableView.register(CarouselTableCell.self, forCellReuseIdentifier: CarouselTableCell.identifier)
        
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "В тренде" : "Все фильмы"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return regularMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CarouselTableCell.identifier, for: indexPath) as? CarouselTableCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: trendMovies)
            
            cell.onMovieSelected = { [weak self] selectedMovie in

                let detailVC = MovieDetailsViewController(movie: selectedMovie)
                self?.navigationController?.pushViewController(detailVC, animated: true)
            }
            return cell
            
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
                return UITableViewCell()
            }
            let currentMovie = regularMovies[indexPath.row]
            cell.configure(with: currentMovie)
                        
            cell.onDetailsButtonTapped = { [weak self] in
                            
                let detailVC = MovieDetailsViewController(movie: currentMovie)
                self?.navigationController?.pushViewController(detailVC, animated: true)
            }
            return cell
        }
    }
}
