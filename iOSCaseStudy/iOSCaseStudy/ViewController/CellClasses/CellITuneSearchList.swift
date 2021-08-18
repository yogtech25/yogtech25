
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
    
    // MARK: Setup cell data
    func setUpData(model: WebData) {
        self.nameLabel.text = model.trackName
        self.thumbnailImage.load(urlString: model.artworkUrl60)
        
        if let array = UserDefaults.standard.value(forKey: SDConstant().visitedWeb) as? [Int] {
            if array.contains(model.trackId) {
                self.nameLabel.textColor = UIColor.gray
            } else {
                self.nameLabel.textColor = UIColor.black
            }
        }
    }
}
