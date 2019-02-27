import UIKit

class DetailVC: UIViewController {
    @IBOutlet var joyButton: UIButton!
    @IBOutlet var sadButton: UIButton!
    @IBOutlet var angryButton: UIButton!
    @IBOutlet var disgustButton: UIButton!
    @IBOutlet var calmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "backToToday", sender: self)
    }
}
