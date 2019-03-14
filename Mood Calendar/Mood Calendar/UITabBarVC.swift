import UIKit
import Foundation

class UITabBarVC: UITabBarController {
    var dateInfo = DateInfo()
    var monthInfo = MonthCalendar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTodayIcon()
        
        //passes info to TodayVC
        let todayVC = self.viewControllers?[0] as! TodayVC
        todayVC.dateInfo = self.dateInfo
        todayVC.monthInfo = self.monthInfo
        //passes info to CalendarVC
        let calendarVC = self.viewControllers?[1] as! CalendarVC
        calendarVC.dateInfo = self.dateInfo
    }
    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print("pressed item")
//    }
    
    //dynamically change icon
    func setTodayIcon(){
        let weekday = NSCalendar.current.component(.weekday, from: Date())
        var pic = ""
        switch weekday{
        case 1: pic = "sun.png"
        case 2: pic = "mon.png"
        case 3: pic = "tues.png"
        case 4: pic = "wednes.png"
        case 5: pic = "thurs.png"
        case 6: pic = "fri.png"
        case 7: pic = "satur.png"
        default: print("something went wrong!")
        }
        self.tabBar.items?[0].image = UIImage(named: pic)
    }
}
