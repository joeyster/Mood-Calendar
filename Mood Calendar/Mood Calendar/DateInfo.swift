import UIKit

class DateInfo {
    var yearMonths2019: [Int: [Int: UIColor?]] = [:]
    var monthMoods2019: [Int: UIColor?] = [:]
    
    init(){
        for day in 1...31{
            monthMoods2019[day] = nil
        }
        for month in 1...12{
            yearMonths2019[month] = monthMoods2019
        }
//        UserDefaults.standard.setValue(yearMonths2019, forKey: "yearMonths2019Key")
    }
}
