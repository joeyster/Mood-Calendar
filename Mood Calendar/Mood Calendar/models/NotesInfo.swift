import UIKit

class NotesInfo {
    var yearMonths2019: [Int: [Int: String]] = [:]
    var monthNotes2019: [Int: String] = [:]
    
    init(){
        for day in 1...31{
            monthNotes2019[day] = "nil"
        }
        for month in 1...12{
            yearMonths2019[month] = monthNotes2019
        }
    }
}
