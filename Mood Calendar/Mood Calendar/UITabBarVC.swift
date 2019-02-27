import UIKit
import Foundation

class UITabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTodayIcon()
    }
        
    func setTodayIcon(){
        let weekday = NSCalendar.current.component(.weekday, from: Date())
        var pic = ""
        switch weekday{
        case 1:
            pic = "sun.png"
        case 2:
            pic = "mon.png"
        case 3:
            pic = "tues.png"
        case 4:
            pic = "wednes.png"
        case 5:
            pic = "thurs.png"
        case 6:
            pic = "fri.png"
        case 7:
            pic = "satur.png"
        default:
            print("something went wrong!")
        }
        self.tabBar.items?[1].image = UIImage(named: pic)
    }
}
