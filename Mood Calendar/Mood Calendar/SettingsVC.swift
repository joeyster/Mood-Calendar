import UIKit

class SettingsVC:UIViewController{
    @IBOutlet var clearDataButton: UIButton!
    @IBOutlet var notifSwitch: UISwitch!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func clearAllData(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure you want to clear all data?",
                                      message: "All data will be cleared and cannot be recovered.",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            for month in 1...12{
                self.defaults.set([:], forKey: "month" + String(month))
            }
            self.performSegue(withIdentifier: "dataCleared", sender: sender)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dataCleared"{
            let todayVC = segue.destination as! UITabBarVC
            todayVC.dateInfo = DateInfo()
        }
    }
}
