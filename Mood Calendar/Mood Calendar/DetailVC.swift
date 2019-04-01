import UIKit

class DetailVC: UIViewController {
    @IBOutlet var joyButton: UIButton!
    @IBOutlet var sadButton: UIButton!
    @IBOutlet var angryButton: UIButton!
    @IBOutlet var disgustButton: UIButton!
    @IBOutlet var calmButton: UIButton!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var joyDescription: UIButton!
    @IBOutlet var sadDescription: UIButton!
    @IBOutlet var angryDescription: UIButton!
    @IBOutlet var disgustDescription: UIButton!
    @IBOutlet var calmDescription: UIButton!
    @IBOutlet var clearDescription: UIButton!
    
    
    var dateInfo: DateInfo?
    var monthInfo = MonthCalendar()
    
    var dateNumber: Int = -1
    let yellowMood = UIColor(red: 255/255, green: 243/255, blue: 159/255, alpha: 1)
    let blueMood = UIColor(red: 140/255, green: 140/255, blue: 237/255, alpha: 1)
    let redMood = UIColor(red: 255/255, green: 105/255, blue: 105/255, alpha: 1)
    let greenMood = UIColor(red: 141/255, green: 255/255, blue: 152/255, alpha: 1)
    let purpleMood = UIColor(red: 199/255, green: 151/255, blue: 255/255, alpha: 1)
    let whiteMood = UIColor.lightGray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMoodColor()
    }
    
    func setMoodColor(){
        joyButton.backgroundColor = yellowMood
        sadButton.backgroundColor = blueMood
        angryButton.backgroundColor = redMood
        disgustButton.backgroundColor = greenMood
        calmButton.backgroundColor = purpleMood
        clearButton.backgroundColor = whiteMood
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "backToToday", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToToday"{
            let todayVC = segue.destination as! UITabBarVC
            if sender as AnyObject? === joyButton ||
                sender as AnyObject? === joyDescription{
                dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]?[self.dateNumber] = "yellow"
            }
            else if sender as AnyObject? === sadButton ||
                sender as AnyObject? === sadDescription{
                dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]?[self.dateNumber] = "blue"
            }
            else if sender as AnyObject? === angryButton ||
                sender as AnyObject? === angryDescription{
                dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]?[self.dateNumber] = "red"
            }
            else if sender as AnyObject? === disgustButton ||
                sender as AnyObject? === disgustDescription{
                dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]?[self.dateNumber] = "green"
            }
            else if sender as AnyObject? === calmButton ||
                sender as AnyObject? === calmDescription{
                dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]?[self.dateNumber] = "purple"
            }
            else if sender as AnyObject? === clearButton ||
                sender as AnyObject? === clearDescription{
                dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]?[self.dateNumber] = "nil"
            }
            todayVC.dateInfo = self.dateInfo!
            todayVC.monthInfo = self.monthInfo
        }
    }
}
