import UIKit
import Foundation

class UITabBarVC: UITabBarController {
    var dateInfo : DateInfo?
    var monthInfo = MonthCalendar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTodayIcon()
        userDefaultsHandler()
        
        //passes info to TodayVC
        let todayVC = self.viewControllers?[0] as! TodayVC
        todayVC.dateInfo = self.dateInfo
        todayVC.monthInfo = self.monthInfo
        //passes info to CalendarVC
        let calendarVC = self.viewControllers?[1] as! CalendarVC
        calendarVC.dateInfo = self.dateInfo
    }
    
    func userDefaultsHandler(){
        let defaults = UserDefaults.standard
        
        //creates an instance for UserDefaults to save
        for month in 1...12{
            var temp: [String:String] = [:]
            for (key, value) in dateInfo!.yearMonths2019[month]!{
                temp[String(key)] = value
            }
            defaults.set(temp, forKey: "month" + String(month))
        }
        
        //plug result back to dateinfo
        for month in 1...12{
            let result = UserDefaults.standard.value(forKey: "month" + String(month))
            let dict = result! as! Dictionary<String, String>
            for (key, value) in dict{
                dateInfo!.yearMonths2019[month]![Int(key)!] = value
            }
        }
    }
    
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
