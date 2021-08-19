
//  Created by rails on 18/08/21.
//

import Foundation
import UIKit

// Constant 

class SDConstant{
    let searchUrl                     = "https://itunes.apple.com/search?term=jack+johnson&imit=100"
    let detailViewController          = "DetailViewController"
    let cellITuneSearchList           = "CellITuneSearchList"
    let deleteAlertMessage            = "Are you sure want to delete this detail"
    let visitedWeb                    = "visitedWeb"
    let deleteObject                  = "deleteObject"
    let delete                        = "Delete"
    let ok                            = "Ok"
    let cancel                        = "Cancel"
    let staticImageUrl                = "https://is5-ssl.mzstatic.com/image/thumb/Purple125/v4/ec/f4/37/ecf4372b-b2c8-ee4c-b579-6ce9a4e94c1c/79e5918a-b9c3-447e-bc9e-3216ce8e007e_Apple_Consumer_1.png/392x696bb.png"
}

// Load image

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
