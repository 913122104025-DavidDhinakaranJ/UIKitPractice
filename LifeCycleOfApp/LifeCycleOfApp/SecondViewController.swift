import UIKit

class SecondViewController: UIViewController {

    //Only runs once per instance of the view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(type(of: self)): viewDidLoad")
    }

    //Runs every time the view is about to show
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        print("\(type(of: self)): viewWillAppear")
    }

    //Runs every time the view finishes appearing
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(type(of: self)): viewDidAppear")
    }
    
    //Runs every time the user navigates away from this screen
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(type(of: self)): viewDidDisappear")
    }
    
    //Runs every time the transition off the screen finishes
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(type(of: self)): viewWillDisappear")
    }
    
    @IBAction func previousScreenTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
