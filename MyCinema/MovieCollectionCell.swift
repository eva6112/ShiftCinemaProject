
import UIKit

class MovieCollectionCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionCell"
    var onDetailsButtonTapped: (() -> Void)?
        
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    private let detailsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Details", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        button.backgroundColor = .label
        button.setTitleColor(.systemBackground, for: .normal)
        button.layer.cornerRadius = 16
            
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
        }()
    
    @objc private func buttonTapped(){
        onDetailsButtonTapped?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailsButton)
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: 140),

            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalTo: posterImageView.widthAnchor, multiplier: 1.3),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            detailsButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            detailsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailsButton.heightAnchor.constraint(equalToConstant: 32),
            
            detailsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
    }
        
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        posterImageView.image = UIImage(named: movie.imageName) ?? UIImage(named: "default_poster")
    }
}
