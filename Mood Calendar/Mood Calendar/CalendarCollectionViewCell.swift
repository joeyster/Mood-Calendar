//source:
//https://stackoverflow.com/questions/31735228/how-to-make-a-simple-collection-view-with-swift

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func prepareForReuse(){
        super.prepareForReuse()
        label.backgroundColor = UIColor.brown
    }
}
