//
//  TableViewCell.swift
//  hr_Scrolling_images
//
//  Created by Prince's Mac on 09/08/23.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
    
    var arr2 = [ProjectRecord1]()
    
    @IBOutlet weak var myCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollection.dataSource = self
        myCollection.delegate = self
        fetchData()
        
    }
    
    //MARK: API CALL.
    func fetchData() {
        guard let url = URL(string: "https://testffc.nimapinfotech.com/testdata.json") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let apiResponse = try decoder.decode(APIResponse.self, from: data)
                    self.arr2 = apiResponse.data.records
                    print(self.arr2)
                    DispatchQueue.main.async {
                        self.myCollection.reloadData()
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

//MARK: UICOLLECTIONVIEW DATASOURSE PROTOCOL STUBS.
extension TableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arr2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CollectionViewCell = myCollection.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)as! CollectionViewCell
        
        CollectionViewCell.images.kf.setImage(with:  URL(string: "\(arr2[indexPath.row].mainImageURL)"))
        CollectionViewCell.titleLBL.text = "\(arr2[indexPath.row].title)"
        CollectionViewCell.descriptionLBL.text = "\(arr2[indexPath.row].shortDescription)"
        CollectionViewCell.collectedValueLBL.text = "\(arr2[indexPath.row].collectedValue)"
        CollectionViewCell.totalValue.text = "\(arr2[indexPath.row].totalValue)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        if let start = dateFormatter.date(from: arr2[indexPath.row].startDate),
           let end = dateFormatter.date(from: arr2[indexPath.row].endDate) {
            let remainingDays = calculateRemainingDays(startDate: start, endDate: end)
            print(remainingDays)
            
            CollectionViewCell.endsLBL.text = "\(remainingDays)"
        }
        
        CollectionViewCell.view1.layer.cornerRadius = 10
        CollectionViewCell.percentView.layer.cornerRadius = .maximum(33,33)
        
        return CollectionViewCell
    }
}
extension TableViewCell : UICollectionViewDelegate {
    
}
extension TableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: myCollection.frame.width/1, height: myCollection.frame.height/1)
    }
    
    //MARK: FUNCTION FOR CALCULATE REMAING DAYS.
    func calculateRemainingDays(startDate: Date, endDate: Date) -> Int {
        let calender = Calendar.current
        let comp = calender.dateComponents([.day], from: startDate, to: endDate)
        
        if let remaningDays = comp.day {
            return max(0, remaningDays)
        }
        return 0
    }
    
}


