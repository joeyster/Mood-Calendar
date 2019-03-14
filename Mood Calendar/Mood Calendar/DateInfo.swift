import UIKit

class DateInfo {
    var yearMonths2019: [Int: [Int: String]] = [:]
    var monthMoods2019: [Int: String] = [:]
    
    init(){
        for day in 1...31{
            monthMoods2019[day] = nil
        }
        for month in 1...12{
            yearMonths2019[month] = monthMoods2019
        }
        
    }
}
