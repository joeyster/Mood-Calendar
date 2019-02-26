import UIKit
import Foundation

class UITabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weekday = NSCalendar.current.component(.weekday, from: Date())
        switch weekday{
        case 1:
            print("Sunday")
            self.tabBar.items?[1].image = UIImage(named: "sun.png")
        case 2:
            print("Monday")
            self.tabBar.items?[1].image = UIImage(named: "mon.png")
        case 3:
            print("Tuesday")
            self.tabBar.items?[1].image = UIImage(named: "tues.png")
        case 4:
            print("Wednesday")
            self.tabBar.items?[1].image = UIImage(named: "wednes.png")
        case 5:
            print("Thursday")
            self.tabBar.items?[1].image = UIImage(named: "thurs.png")
        case 6:
            print("Friday")
            self.tabBar.items?[1].image = UIImage(named: "fri.png")
        case 7:
            print("Saturday")
            self.tabBar.items?[1].image = UIImage(named: "satur.png")
        default:
            print("something went wrong!")
        }
    }
    
    
}
