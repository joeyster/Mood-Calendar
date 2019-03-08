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
        let dateString = String(today.year!) + "/" + String(today.month!) + "/01"
//        let dateString = "2019/01/01"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let specificDate = formatter.date(from: dateString)
        
        dateComponents = NSCalendar.current.dateComponents(
            [.year, .month, .day, .weekday],
            from: specificDate!)
    }
    
    init(today: String){
        let today = NSCalendar.current.dateComponents(
            [.year, .month, .day],
            from: Date())
        
        //creates Date object
        let dateString = String(today.year!) + "/" + String(today.month!) + "/" + String(today.day!)
        //        let dateString = "2019/01/01"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let specificDate = formatter.date(from: dateString)
        
        dateComponents = NSCalendar.current.dateComponents(
            [.year, .month, .day, .weekday],
            from: specificDate!)
    }
    
    init(specificDate: String){
        let dateString = specificDate
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let specificDate = formatter.date(from: dateString)
        
        dateComponents = NSCalendar.current.dateComponents(
            [.year, .month, .day, .weekday],
            from: specificDate!)
    }
    
    func getRow()-> Int{
        return dateComponents.weekOfMonth!
    }

    func getColumn()-> Int{
        return dateComponents.weekday!
    }
}
