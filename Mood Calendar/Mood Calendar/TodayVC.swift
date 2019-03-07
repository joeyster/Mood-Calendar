import UIKit

class TodayVC: UIViewController {
    @IBOutlet var A0: UIButton!
    @IBOutlet var A1: UIButton!
    @IBOutlet var A2: UIButton!
    @IBOutlet var A3: UIButton!
    @IBOutlet var A4: UIButton!
    @IBOutlet var A5: UIButton!
    @IBOutlet var A6: UIButton!
    
    @IBOutlet var B0: UIButton!
    @IBOutlet var B1: UIButton!
    @IBOutlet var B2: UIButton!
    @IBOutlet var B3: UIButton!
    @IBOutlet var B4: UIButton!
    @IBOutlet var B5: UIButton!
    @IBOutlet var B6: UIButton!
    
    @IBOutlet var C0: UIButton!
    @IBOutlet var C1: UIButton!
    @IBOutlet var C2: UIButton!
    @IBOutlet var C3: UIButton!
    @IBOutlet var C4: UIButton!
    @IBOutlet var C5: UIButton!
    @IBOutlet var C6: UIButton!
    
    @IBOutlet var D0: UIButton!
    @IBOutlet var D1: UIButton!
    @IBOutlet var D2: UIButton!
    @IBOutlet var D3: UIButton!
    @IBOutlet var D4: UIButton!
    @IBOutlet var D5: UIButton!
    @IBOutlet var D6: UIButton!
    
    @IBOutlet var E0: UIButton!
    @IBOutlet var E1: UIButton!
    @IBOutlet var E2: UIButton!
    @IBOutlet var E3: UIButton!
    @IBOutlet var E4: UIButton!
    @IBOutlet var E5: UIButton!
    @IBOutlet var E6: UIButton!
    
    @IBOutlet var F0: UIButton!
    @IBOutlet var F1: UIButton!
    @IBOutlet var F2: UIButton!
    @IBOutlet var F3: UIButton!
    @IBOutlet var F4: UIButton!
    @IBOutlet var F5: UIButton!
    @IBOutlet var F6: UIButton!
    
    var buttonSetA: [UIButton] = []
    var buttonSetB: [UIButton] = []
    var buttonSetC: [UIButton] = []
    var buttonSetD: [UIButton] = []
    var buttonSetE: [UIButton] = []
    var buttonSetF: [UIButton] = []
    
    @IBOutlet var imageView: UIImageView!
    
    var monthInfo = MonthCalendar()
    var dateInfo: DateInfo?
    var dateNumber: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMonthPicture()
        fillButtonSets()
        fillCalendar()
        clearNonEssentials()
//        print("TodayVC viewDidLoad")
    }
    
    func clearAllColors(){
        for column in 0...6{
            buttonSetA[column].backgroundColor = UIColor.white
            buttonSetB[column].backgroundColor = UIColor.white
            buttonSetC[column].backgroundColor = UIColor.white
            buttonSetD[column].backgroundColor = UIColor.white
            buttonSetE[column].backgroundColor = UIColor.white
            buttonSetF[column].backgroundColor = UIColor.white
        }
    }
    
    func setMonthPicture(){
        var monthPic = ""
        switch monthInfo.dateComponents.month!{
        case 1:
            monthPic = "January.jpg"
        case 2:
            monthPic = "February.jpg"
        case 3:
            monthPic = "March.jpg"
        case 4:
            monthPic = "April.jpg"
        case 5:
            monthPic = "May.jpg"
        case 6:
            monthPic = "June.jpg"
        case 7:
            monthPic = "July.jpg"
        case 8:
            monthPic = "August.jpg"
        case 9:
            monthPic = "September.jpg"
        case 10:
            monthPic = "October.jpg"
        case 11:
            monthPic = "November.jpg"
        case 12:
            monthPic = "December.jpg"
        default:
            print("something went wrong")
        }
        imageView.image = UIImage(named: monthPic)
    }
    
    func fillButtonSets(){
        self.buttonSetA = [A0, A1, A2, A3, A4, A5, A6]
        self.buttonSetB = [B0, B1, B2, B3, B4, B5, B6]
        self.buttonSetC = [C0, C1, C2, C3, C4, C5, C6]
        self.buttonSetD = [D0, D1, D2, D3, D4, D5, D6]
        self.buttonSetE = [E0, E1, E2, E3, E4, E5, E6]
        self.buttonSetF = [F0, F1, F2, F3, F4, F5, F6]
    }
    
    func fillCalendar(){
        //fill out the entire calendar
        let startColumn = monthInfo.getColumn() - 1 //monthInfo.getColumn()--> 1-7. sunday being 1
        var day = 1
        for column in startColumn...6{
            buttonSetA[column].setTitle(String(day), for: .normal)
            day += 1
        }
        for column in 0...6{
            buttonSetB[column].setTitle(String(day), for: .normal)
            buttonSetC[column].setTitle(String(day+7), for: .normal)
            buttonSetD[column].setTitle(String(day+14), for: .normal)
            buttonSetE[column].setTitle(String(day+21), for: .normal)
            buttonSetF[column].setTitle(String(day+28), for: .normal)
            day += 1
        }
        //fill color from temp "database"
        let numOfDays: Int
        let year = monthInfo.dateComponents.year!
        //      https://h4labs.wordpress.com/2016/01/11/isleapyear-in-swift/
        if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)){
            numOfDays = monthInfo.leapDays[monthInfo.dateComponents.month!-1]
        }
        else{
            numOfDays = monthInfo.monthDays[monthInfo.dateComponents.month!-1]
        }
        for date in 1...numOfDays{
            for column in 0...6{
                if let moodColor = dateInfo?.yearMonths2019[monthInfo.dateComponents.month!]![date]{
                    if buttonSetA[column].title(for: .normal)! == String(date){
                        buttonSetA[column].backgroundColor = moodColor
                    }
                    else if buttonSetB[column].title(for: .normal)! == String(date){
                        buttonSetB[column].backgroundColor = moodColor
                    }
                    else if buttonSetC[column].title(for: .normal)! == String(date){
                        buttonSetC[column].backgroundColor = moodColor
                    }
                    else if buttonSetD[column].title(for: .normal)! == String(date){
                        buttonSetD[column].backgroundColor = moodColor
                    }
                    else if buttonSetE[column].title(for: .normal)! == String(date){
                        buttonSetE[column].backgroundColor = moodColor
                    }
                    else if buttonSetF[column].title(for: .normal)! == String(date){
                        buttonSetF[column].backgroundColor = moodColor
                    }
                }
            }
        }
    }
    
    func clearNonEssentials(){
        let startColumn = monthInfo.getColumn() - 1
        //clear non-Int buttons
        if startColumn != 0{
            for column in 0...startColumn-1{
                buttonSetA[column].setTitle("", for: .normal)
                buttonSetA[column].isEnabled = false
            }
        }
        
        //clear non-essential dates
        let numOfDays: Int
        let year = monthInfo.dateComponents.year!
        //      https://h4labs.wordpress.com/2016/01/11/isleapyear-in-swift/
        if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)){
            numOfDays = monthInfo.leapDays[monthInfo.dateComponents.month!-1]
        }
        else{
            numOfDays = monthInfo.monthDays[monthInfo.dateComponents.month!-1]
        }
        for column in 0...6{
            if Int(buttonSetE[column].titleLabel!.text!)! > numOfDays{
                buttonSetE[column].setTitle("", for: .normal)
                buttonSetE[column].isEnabled = false
            }
            if Int(buttonSetF[column].titleLabel!.text!)! > numOfDays{
                buttonSetF[column].setTitle("", for: .normal)
                buttonSetF[column].isEnabled = false
            }
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showDateInfo", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDateInfo"{
            let detailVC = segue.destination as! DetailVC
            let sender = sender as AnyObject
            detailVC.dateInfo = self.dateInfo
            detailVC.monthInfo = self.monthInfo
            if let buttonTitle = sender.title(for: .normal){
                detailVC.dateNumber = Int(buttonTitle)!
            }
        }
    }
}
