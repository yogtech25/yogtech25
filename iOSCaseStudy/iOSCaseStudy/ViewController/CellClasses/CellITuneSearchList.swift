
//  Created by rails on 17/08/21.
//

import UIKit

class CellITuneSearchList: UITableViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpData(model: WebData) {
        self.nameLabel.text = model.trackName
        self.thumbnailImage.load(urlString: model.artworkUrl60)
        if let array = UserDefaults.standard.value(forKey: "visitedWeb") as? [Int] {
            if array.contains(model.trackId) {
                self.nameLabel.textColor = UIColor.gray
            } else {
                self.nameLabel.textColor = UIColor.blue
            }
        }
    }
}

extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
