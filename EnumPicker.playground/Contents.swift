//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


enum EventType: Int, CaseIterable {
    case human = 1
    case vehicle = 2
    case animal = 3
    case other = 4
    
    var eventName: String {
        switch self {
        case .human:
            return "human"
        case .vehicle:
            return "vehicle"
        case .animal:
            return "animal"
        case .other:
            return "other"
        }
    }
}

class MyViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let picker = UIPickerView()
    var strings = [String]() {
        didSet {
            picker.reloadAllComponents()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 600))
        view.backgroundColor = .white
        
        view.addSubview(picker)
        
        self.view = view
        
        picker.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 216)
        picker.backgroundColor = UIColor.lightGray
        picker.delegate = self
        picker.dataSource = self
        
        strings = EventType.allCases.map { $0.eventName }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return strings.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return strings[row]
    }
}

PlaygroundPage.current.liveView = MyViewController()
