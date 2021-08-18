
//  Created by rails on 17/08/21.
//

import UIKit

class ITuneSearchListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var webListData: [WebData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: SDConstant().cellITuneSearchList, bundle: nil), forCellReuseIdentifier: SDConstant().cellITuneSearchList)
        // API call
        ITuneService().fetchWebList { (brands, error) in
            self.webListData = brands?.webs
            self.addDeletedObjectInUserDefault()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addDeletedObjectInUserDefault()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//Tableview method extension
extension ITuneSearchListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.webListData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: SDConstant().cellITuneSearchList) as! CellITuneSearchList
        if let model = self.webListData?[indexPath.row] {
            cell.setUpData(model: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailScreen = self.storyboard?.instantiateViewController(withIdentifier: SDConstant().detailViewController) as! DetailViewController
        detailScreen.webListData = self.webListData?[indexPath.row]
        self.navigationController?.pushViewController(detailScreen, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.4) {
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
        }
    }
}

//Custome method extension
extension ITuneSearchListViewController {
    func addDeletedObjectInUserDefault() {
        if let array = UserDefaults.standard.value(forKey: SDConstant().deleteObject) as? [Int] {
            let deletedArray = array as NSArray
            let filterdArray = self.webListData?.filter{!(deletedArray.contains($0.trackId))}
            self.webListData = filterdArray
        }
    }
}
