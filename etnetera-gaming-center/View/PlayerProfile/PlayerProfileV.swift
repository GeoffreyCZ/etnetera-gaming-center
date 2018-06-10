import UIKit

class PlayerProfileV: UIScrollView {
    private let gray = UIColor(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
    private let imageWidthAndHeight: CGFloat = 150
    private let padding: CGFloat = 35
    
    var content: PlayerProfile? {
        didSet {
            if let bussinessCard = content {
                setupContent(content: bussinessCard)
            }
        }
    }
    
    private lazy var stackView: UIStackView = UIStackView()
    private lazy var avatarImageView: UIImageView = makeAvatarImageView()
    private lazy var nameLabel: UILabel = makeNameLabel()
    private lazy var positionLabel: UILabel = makePositionLabel()
    private lazy var separator: UIView = makeSeparatorView()
    private lazy var scoresViews: [ScoreV] = makeScoresViews()
    
    func setupContent(content: PlayerProfile) -> Void {
        
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 30
        
        stackView.addArrangedSubview(avatarImageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(positionLabel)
        stackView.addArrangedSubview(separator)
        scoresViews.forEach {
            stackView.addArrangedSubview($0)
            stackView.setCustomSpacing(15, after: $0)
        }
        
        addSubview(stackView)
        addConstraints()
        loadContent(content)
    }
    
    private func loadContent(_ content: PlayerProfile) {
        
        //Get participant's image from url and set it using Kingfisher
        guard let imageUrl = content.imageUrl else { return }
        let url = URL(string: imageUrl)
        avatarImageView.kf.setImage(with: url, completionHandler: { [weak self] (_, _, _, _) in
            self?.setNeedsLayout()
        })
        
        nameLabel.text = content.name
        positionLabel.text = content.position
        zip(scoresViews, content.scores).forEach {
            $0.0.content = $0.1
        }
    }
    
    private func addConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.widthAnchor.constraint(equalToConstant: 2 * avatarImageView.layer.cornerRadius).isActive = true
        avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor).isActive = true
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -2 * padding).isActive = true
        
        scoresViews.forEach { row in
            row.translatesAutoresizingMaskIntoConstraints = false
            row.heightAnchor.constraint(equalToConstant: 44).isActive = true
            row.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -2 * padding).isActive = true
        }
    }
    
    private func makeAvatarImageView() -> UIImageView {
        let rVal = UIImageView()
        rVal.layer.borderWidth = 1
        rVal.layer.borderColor = self.gray.cgColor
        rVal.layer.cornerRadius = self.imageWidthAndHeight / 2
        rVal.contentMode = .scaleAspectFit
        return rVal
    }
    
    private func makeNameLabel() -> UILabel {
        let rVal = UILabel()
        rVal.textAlignment = .center
        rVal.font = UIFont.systemFont(ofSize: 25)
        return rVal
    }
    
    private func makeButton() -> UIButton {
        let rVal = UIButton()
        rVal.setTitleColor(.black, for: .normal)
        rVal.setTitleColor(UIColor.black.withAlphaComponent(0.6), for: .highlighted)
        return rVal
    }
    
    private func makePositionLabel() -> UILabel {
        let rVal = UILabel()
        rVal.textAlignment = .center
        rVal.font = UIFont.boldSystemFont(ofSize: 20)
        return rVal
    }
    
    private func makeSeparatorView() -> UIView {
        let rVal = UIView()
        rVal.backgroundColor = self.gray
        return rVal
    }
    
    private func makeScoresViews() -> [ScoreV] {
        return content?.scores.map { _ in
            ScoreV()
            } ?? []
    }
}
