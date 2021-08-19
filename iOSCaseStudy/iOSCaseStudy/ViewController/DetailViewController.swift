
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
        if let webListData = webListData {
            self.setDataInOutlet(webListData: webListData)
        }
    }
    
    func setDataInOutlet(webListData: WebData) {
        self.trackNameLabel.text = "Track name: \(webListData.trackName)"
        self.artistName.text = "Artist name: \(webListData.artistName)"
        self.trackId.text = "Track ID: \(webListData.trackId)"
        self.thumbnailImage.load(urlString: webListData.artworkUrl60)
    }
}

//Button extension
extension DetailViewController {
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        let refreshAlert = UIAlertController(title: SDConstant().delete, message: SDConstant().deleteAlertMessage, preferredStyle: UIAlertController.Style.alert)
        refreshAlert.addAction(UIAlertAction(title: SDConstant().ok, style: .default, handler: { (action: UIAlertAction) in
            if let object = self.webListData {
                self.addDeletedObjectInUserDefault(webObjectId: object.trackId)
            }
        }))
        refreshAlert.addAction(UIAlertAction(title: SDConstant().cancel, style: .cancel, handler: { (action: UIAlertAction) in
            refreshAlert .dismiss(animated: true, completion: nil)
        }))
        self.present(refreshAlert, animated: true, completion: nil)
    }
}

//Custome method extension
extension DetailViewController {
    func addDeletedObjectInUserDefault(webObjectId: Int) {
        if let array = UserDefaults.standard.value(forKey: SDConstant().deleteObject) as? [Int] {
            var arrDeletedObject = array
            arrDeletedObject.append(webObjectId)
            UserDefaults.standard.setValue(arrDeletedObject, forKey: SDConstant().deleteObject)
        } else {
            UserDefaults.standard.setValue([webObjectId], forKey: SDConstant().deleteObject)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func addWebsiteInVisitedList(trackId: Int) {
        if let array = UserDefaults.standard.value(forKey: SDConstant().visitedWeb) as? [Int] {
            var arrVisitedObject = array
            arrVisitedObject.append(trackId)
            UserDefaults.standard.setValue(arrVisitedObject, forKey: SDConstant().visitedWeb)
        } else {
            UserDefaults.standard.setValue([trackId], forKey: SDConstant().visitedWeb)
        }
    }
}
