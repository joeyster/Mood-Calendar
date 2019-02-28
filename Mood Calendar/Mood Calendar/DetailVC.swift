import UIKit

class DetailVC: UIViewController {
    @IBOutlet var joyButton: UIButton!
    @IBOutlet var sadButton: UIButton!
    @IBOutlet var angryButton: UIButton!
    @IBOutlet var disgustButton: UIButton!
    @IBOutlet var calmButton: UIButton!
    
    var buttonID: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("buttonID: " + String(self.buttonID))
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "backToToday", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var color = ""
        if segue.identifier == "backToToday"{
            let todayVC = segue.destination as! UITabBarVC
            if sender as AnyObject? === joyButton {
                color = "yellow"
            }
            else if sender as AnyObject? === sadButton{
                color = "blue"
            }
            else if sender as AnyObject? === angryButton{
                color = "red"
            }
            else if sender as AnyObject? === disgustButton{
                color = "green"
            }
            else if sender as AnyObject? === calmButton{
                color = "purple"
            }
            todayVC.moodColor = color
            todayVC.buttonID = buttonID
        }
    }
    
}
