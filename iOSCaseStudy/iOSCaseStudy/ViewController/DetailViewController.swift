
//  Created by rails on 17/08/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackId: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!

    var webListData: WebData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addWebsiteInVisitedList(trackId: webListData?.trackId ?? 0)
        self.setDataInOutlet()
    }
    
    func setDataInOutlet() {
        self.trackNameLabel.text = "Track name: \(webListData?.trackName ?? "")"
        self.artistName.text = "Artist name: \(webListData?.artistName ?? "")"
        self.trackId.text = "Track ID: \(webListData?.trackId ?? 0)"

        if let url = URL(string: webListData?.artworkUrl60 ?? "") {
            if let data = try? Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.thumbnailImage.image = UIImage(data: data)
                }
            }
        }
    }
}

//Button extension
extension DetailViewController {
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        let refreshAlert = UIAlertController(title: "Delete", message: SDConstant().deleteAlertMessage, preferredStyle: UIAlertController.Style.alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            if let object = self.webListData {
                self.addDeletedObjectInUserDefault(webObject: object)
            }
        }))
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            refreshAlert .dismiss(animated: true, completion: nil)
        }))
        self.present(refreshAlert, animated: true, completion: nil)
    }
}

//Custome method extension
extension DetailViewController {
    func addDeletedObjectInUserDefault(webObject: WebData) {
        if let array = UserDefaults.standard.value(forKey: "deletedObject") as? [WebData] {
            var arrDeletedObject = array
            arrDeletedObject.append(webObject)
            UserDefaults.standard.setValue(arrDeletedObject, forKey: "deletedObject")
        } else {
            UserDefaults.standard.setValue([webObject], forKey: "deletedObject")
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func addWebsiteInVisitedList(trackId: Int) {
        if let array = UserDefaults.standard.value(forKey: "visitedWeb") as? [Int] {
            var arrVisitedObject = array
            arrVisitedObject.append(trackId)
            UserDefaults.standard.setValue(arrVisitedObject, forKey: "visitedWeb")
        } else {
            UserDefaults.standard.setValue([trackId], forKey: "visitedWeb")
        }
    }
}
