import UIKit

class CalendarVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var dateInfo: DateInfo?
    var monthInfo = MonthCalendar()
    
    let reuseIdentifier = "cell"
    let monthInitial: [String] = ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]
    var items: [String] = []
    var month: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillItemsArray()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12*31 //months * days
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath as IndexPath) as! MyCollectionViewCell
       
        cell.label.text = self.items[indexPath.item]
        if let moodColor = dateInfo?.yearMonths2019[month]?[Int(self.items[indexPath.item])!]{
            cell.label.textColor = UIColor.white
            cell.label.backgroundColor = moodColor
        }
        month = month + 1
        if month == 12{
            month = 0
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toSpecificMonth", sender: indexPath.item)
    }
    
    func fillItemsArray(){
        print("filling the array")
        for days in 1...31{
            for _ in 1...12{
                items.append(String(days))
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let month = (sender as! Int % 12) + 1
        let todayVC = segue.destination as! UITabBarVC
        switch Int(month){
            case 1:
                todayVC.monthInfo = MonthCalendar(specificDate: "2019/01/01")
            case 2:
                todayVC.monthInfo = MonthCalendar(specificDate: "2019/02/01")
            case 3:
                todayVC.monthInfo = MonthCalendar(specificDate: "2019/03/01")
            case 4:
                todayVC.monthInfo = MonthCalendar(specificDate: "2019/04/01")
            case 5:
                todayVC.monthInfo = MonthCalendar(specificDate: "2019/05/01")
            case 6:
                todayVC.monthInfo = MonthCalendar(specificDate: "2019/06/01")
            case 7:
                todayVC.monthInfo = MonthCalendar(specificDate: "2019/07/01")
            case 8:
                todayVC.monthInfo = MonthCalendar(specificDate: "2019/08/01")
            case 9:
                todayVC.monthInfo = MonthCalendar(specificDate: "2019/09/01")
            case 10:
                todayVC.monthInfo = MonthCalendar(specificDate: "2019/10/01")
            case 11:
                todayVC.monthInfo = MonthCalendar(specificDate: "2019/11/01")
            case 12:
                todayVC.monthInfo = MonthCalendar(specificDate: "2019/12/01")
            default:
                print("something went wrong")
        }
        todayVC.dateInfo = self.dateInfo!
    }
}
