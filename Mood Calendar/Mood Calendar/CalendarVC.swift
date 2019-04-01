import UIKit

class CalendarVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var dateInfo: DateInfo?
    var monthInfo = MonthCalendar()
    
    let reuseIdentifier = "cell"
    let monthInitial: [String] = ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]
    var items: [String] = ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]
    var month: Int = 1
    
    let yellowMood = UIColor(red: 255/255, green: 243/255, blue: 159/255, alpha: 1)
    let blueMood = UIColor(red: 140/255, green: 140/255, blue: 237/255, alpha: 1)
    let redMood = UIColor(red: 255/255, green: 105/255, blue: 105/255, alpha: 1)
    let greenMood = UIColor(red: 141/255, green: 255/255, blue: 152/255, alpha: 1)
    let purpleMood = UIColor(red: 199/255, green: 151/255, blue: 255/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillItemsArray()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12*31+12 //months * days + month initials
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath as IndexPath) as! MyCollectionViewCell
        
        cell.label.text = self.items[indexPath.item]
        if !monthInitial.contains(self.items[indexPath.item]) && self.items[indexPath.item] != " "{
            if let color = dateInfo?.yearMonths2019[month]?[Int(self.items[indexPath.item])!]{
                var moodColor: UIColor?
                switch color{
                    case "yellow": moodColor = yellowMood
                    case "blue": moodColor = blueMood
                    case "red": moodColor = redMood
                    case "green": moodColor = greenMood
                    case "purple": moodColor = purpleMood
                    case "nil": moodColor = UIColor.white
                    default: print("something went wrong in calendarvc")
                }
                if color != "nil"{ cell.label.textColor = UIColor.white }
                else{ cell.label.textColor = UIColor.lightGray }
                cell.label.backgroundColor = moodColor
            }
        }
        else{
            cell.label.textColor = UIColor.black
            cell.label.font = UIFont.boldSystemFont(ofSize: 16.0)
        }
        
        month = month + 1
        if month == 13 { month = 1 }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toSpecificMonth", sender: indexPath.item)
    }
    
    func fillItemsArray(){
        let year = monthInfo.dateComponents.year!
        var daysArray: [Int] = []
        //      https://h4labs.wordpress.com/2016/01/11/isleapyear-in-swift/
        if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)){
            daysArray = monthInfo.leapDays
        }
        else{
            daysArray = monthInfo.monthDays
        }
        for days in 1...31{
            for month in 1...12{
                if days > daysArray[month - 1]{
                    items.append(" ")
                }
                else{
                    items.append(String(days))
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let month = (sender as! Int % 12) + 1
        let todayVC = segue.destination as! UITabBarVC
        switch Int(month){
            case 1: todayVC.monthInfo = MonthCalendar(specificDate: "2019/01/01")
            case 2: todayVC.monthInfo = MonthCalendar(specificDate: "2019/02/01")
            case 3: todayVC.monthInfo = MonthCalendar(specificDate: "2019/03/01")
            case 4: todayVC.monthInfo = MonthCalendar(specificDate: "2019/04/01")
            case 5: todayVC.monthInfo = MonthCalendar(specificDate: "2019/05/01")
            case 6: todayVC.monthInfo = MonthCalendar(specificDate: "2019/06/01")
            case 7: todayVC.monthInfo = MonthCalendar(specificDate: "2019/07/01")
            case 8: todayVC.monthInfo = MonthCalendar(specificDate: "2019/08/01")
            case 9: todayVC.monthInfo = MonthCalendar(specificDate: "2019/09/01")
            case 10: todayVC.monthInfo = MonthCalendar(specificDate: "2019/10/01")
            case 11: todayVC.monthInfo = MonthCalendar(specificDate: "2019/11/01")
            case 12: todayVC.monthInfo = MonthCalendar(specificDate: "2019/12/01")
            default: print("something went wrong")
        }
        todayVC.dateInfo = self.dateInfo!
    }
}
