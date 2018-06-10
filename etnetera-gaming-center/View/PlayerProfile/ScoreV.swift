import UIKit

public class ScoreV: UIView {
    
    private lazy var titleLabel: UILabel = makeTitleLabel()
    private lazy var scoreLabel: UILabel = makeScoreLabel()
    
    var content: ScoreDetail? {
        didSet {
            setupContent()
        }
    }
    
    private func setupContent() {
        addSubview(titleLabel)
        addSubview(scoreLabel)
        addConstraints()
        
        titleLabel.text = content?.name ?? ""
        scoreLabel.text = String(content?.value ?? 0)
    }
    
    private func addConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scoreLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scoreLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scoreLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
        scoreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func makeTitleLabel() -> UILabel {
        let rVal = UILabel()
        rVal.font = UIFont.systemFont(ofSize: 15)
        return rVal
    }
    
    private func makeScoreLabel() -> UILabel {
        let rVal = UILabel()
        rVal.font = UIFont.systemFont(ofSize: 15)
        rVal.textAlignment = .right
        return rVal
    }
}
