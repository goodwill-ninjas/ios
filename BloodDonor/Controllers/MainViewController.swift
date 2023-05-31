import UIKit
//Defines a new Swift class called MainViewController that inherits from UIViewController.
class MainViewController: UIViewController {
    
    //Overrides the default initializer of UIViewController to provide a custom initializer for MainViewController. This initializer takes two optional parameters, nibNameOrNil and nibBundleOrNil, both of type String? and Bundle?, respectively.
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        //Calls the init(nibName:bundle:) method of the superclass UIViewController with nil values for both parameters, which creates a new instance of the view controller without a nib file or a bundle.
        super.init(nibName: nil, bundle: nil)
        //Calls the commonInit() method defined below, which can be overridden in subclasses to perform additional setup.
        commonInit()
    }
    //Defines another initializer required by the compiler when MainViewController is initialized from an archive or storyboard. It takes a single parameter, coder, of type NSCoder.
    required init?(coder: NSCoder) {
        //Because MainViewController does not support initialization from a coder, this line throws a runtime error if this initializer is called at runtime.
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        
    }
    
}

