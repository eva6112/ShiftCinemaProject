
import UIKit

class MovieCell: UITableViewCell {

    static let identifier: String = "MovieCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Details", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailsButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            posterImageView.heightAnchor.constraint(equalToConstant: 250),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            detailsButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            detailsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            detailsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            detailsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            detailsButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configure(with movie: Movie){
        titleLabel.text = movie.title
        if let image = UIImage(named: movie.imageName){
            posterImageView.image = image
        } else {
            posterImageView.image = UIImage(named: "default_poster")
        }
        posterImageView.contentMode = .scaleAspectFill
    }
}
