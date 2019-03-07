import UIKit

class CalendarVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var dateInfo: DateInfo?
    
    let reuseIdentifier = "cell"
    let monthInitial: [String] = ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]
    var items: [String] = []
    var month: Int = 1
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath as IndexPath) as! MyCollectionViewCell
       
        cell.label.text = self.items[indexPath.item]
        if let moodColor = dateInfo?.yearMonths2019[month]?[Int(self.items[indexPath.item])!]{
            cell.label.backgroundColor = moodColor
        }
        month = month + 1
        if month == 12{
            month = 0
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
        let month = (indexPath.item % 12) + 1
        switch Int(month){
            case 1:
                print("Jan")
            case 2:
                print("Feb")
            case 3:
                print("Mar")
            case 4:
                print("Apr")
            case 5:
                print("May")
            case 6:
                print("June")
            case 7:
                print("July")
            case 8:
                print("Aug")
            case 9:
                print("Sept")
            case 10:
                print("Oct")
            case 11:
                print("Nov")
            case 12:
                print("Dec")
            default:
                print("something went wrong")
        }
    }
    
    var model = MonthCalendar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillItemsArray()
    }
    
    func fillItemsArray(){
        for days in 1...31{
            for _ in 1...12{
                items.append(String(days))
            }
        }
    }
}
