import UIKit

class SettingsVC:UIViewController{
    @IBOutlet var clearDataButton: UIButton!
    @IBOutlet var notifSwitch: UISwitch!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func clearAllData(_ sender: Any) {
        for month in 1...12{
            defaults.set([:], forKey: "month" + String(month))
        }
        performSegue(withIdentifier: "dataCleared", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dataCleared"{
            let todayVC = segue.destination as! UITabBarVC
            todayVC.dateInfo = DateInfo()
        }
    }
}
