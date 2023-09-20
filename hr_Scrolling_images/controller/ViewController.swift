import UIKit

class MainTableViewController: UIViewController {

    var arr1 = ["CollectionViewCell"].count
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}
//MARK: PROTOCOL STUBS OF UITABLEVIEW DATASOURSE.
extension MainTableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr1.nonzeroBitCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)as! TableViewCell
        TableViewCell.myCollection.self
        
        return TableViewCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "Section_1"
//        }else if section == 1 {
//            return "section_2"
//        }else if section == 2 {
//            return "Section_3"
//        } else if section == 3{
//            return "Section_4"
//        }else if section == 4 {
//            return "section_5"
//        }else if section == 5 {
//            return "section_6"
//        }else if section == 6 {
//            return "section_7"
//        }else if section == 7 {
//            return "section_8"
//        }else if section == 8 {
//            return "section_9"
//        }else if section == 9 {
//            return "section_10"
//        }else if section == 10{
//            return "section_11"
//        }else {
//            return title
//        }
//    }
}

extension MainTableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        280
    }
}
