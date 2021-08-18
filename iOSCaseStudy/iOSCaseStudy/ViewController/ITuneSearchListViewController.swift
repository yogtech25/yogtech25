
//  Created by rails on 17/08/21.
//

import UIKit

class ITuneSearchListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var webListData: [WebData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: SDConstant().cellITuneSearchList, bundle: nil), forCellReuseIdentifier: SDConstant().cellITuneSearchList)
        ITuneService().fetchWebList { (brands, error) in
            self.webListData = brands?.webs
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.tableView.reloadData()
        DispatchQueue.main.async { self.tableView.reloadData() }

    }
}

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
}

//Custome method extension
extension ITuneSearchListViewController {
    func addDeletedObjectInUserDefault(trackId: Int) {
        if (UserDefaults.standard.value(forKey: "deletedObject") as? [WebData]) != nil {
        }
    }
}
