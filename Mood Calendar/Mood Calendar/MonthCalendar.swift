import UIKit

class MonthCalendar{
    let leapDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var dateComponents: DateComponents
    
    init(){
        let today = NSCalendar.current.dateComponents(
            [.year, .month, .day],
            from: Date())
        
        //creates Date object
//        let dateString = String(today.year!) + "/" + String(today.month!) + "/01"
        let dateString = "2019/03/01"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let specificDate = formatter.date(from: dateString)
        
        dateComponents = NSCalendar.current.dateComponents(
            [.year, .month, .day,
             .weekday, .weekdayOrdinal,
             .weekOfMonth, .weekOfYear, .yearForWeekOfYear],
            from: specificDate!)
    }
    
    func getRow()-> Int{
        return dateComponents.weekOfMonth!
    }

    func getColumn()-> Int{
        return dateComponents.weekday!
    }
    
    
    
    
//        print(dateComponents.isLeapMonth!)
}
