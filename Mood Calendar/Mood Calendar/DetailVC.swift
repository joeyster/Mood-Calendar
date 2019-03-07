import UIKit

class DetailVC: UIViewController {
    @IBOutlet var joyButton: UIButton!
    @IBOutlet var sadButton: UIButton!
    @IBOutlet var angryButton: UIButton!
    @IBOutlet var disgustButton: UIButton!
    @IBOutlet var calmButton: UIButton!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var dateInfo: DateInfo?
    var monthInfo = MonthCalendar()
    var dateNumber: Int = -1
    let yellowMood = UIColor(red: 254/255, green: 255/255, blue: 134/255, alpha: 1)
    let blueMood = UIColor(red: 80/255, green: 85/255, blue: 255/255, alpha: 0.8)
    let redMood = UIColor(red: 255/255, green: 82/255, blue: 82/255, alpha: 1)
    let greenMood = UIColor(red: 151/255, green: 255/255, blue: 132/255, alpha: 1)
    let purpleMood = UIColor(red: 182/255, green: 123/255, blue: 255/255, alpha: 1)
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
            if sender as AnyObject? === joyButton {
                dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]?[self.dateNumber] = yellowMood
            }
            else if sender as AnyObject? === sadButton{
                dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]?[self.dateNumber] = blueMood
            }
            else if sender as AnyObject? === angryButton{
                dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]?[self.dateNumber] = redMood
            }
            else if sender as AnyObject? === disgustButton{
                dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]?[self.dateNumber] = greenMood
            }
            else if sender as AnyObject? === calmButton{
                dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]?[self.dateNumber] = purpleMood
            }
            else if sender as AnyObject? === clearButton{
                dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]?[self.dateNumber] = UIColor.white
            }
            todayVC.dateInfo = self.dateInfo!
        }
    }
}
