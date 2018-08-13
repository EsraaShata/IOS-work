//

import UIKit

class ColorPicker: UIViewController {
    var delegate: colorTranseferDelegate?=nil
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func ButnPressed (sender:UIButton){
        delegate?.userChoice(color: sender.backgroundColor!, colorName: sender.titleLabel!.text!)
        self.navigationController?.popViewController(animated: true)
    }

}
