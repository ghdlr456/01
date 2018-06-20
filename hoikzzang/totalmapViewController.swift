
import UIKit
import MapKit

class totalmapViewController: UIViewController {

    @IBOutlet weak var total: MKMapView!
    
    
    var name : [String] = []
    var address : [String] = []
    var annotation = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMap(name: name, address: address)
       
    }
    
    var count = 0
    func viewMap(name:[String], address:[String]) {
        for loc in address {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(loc, completionHandler: { (placemarks: [CLPlacemark]?, error: Error?) -> Void in
            if let error = error {
                print(error)
                return
            }
            if placemarks != nil {
                let placemark = placemarks![0]
                print(placemarks![0])
                
                //pin point 을 저장
                let annotation = MKPointAnnotation()
                if let location = placemark.location {
                    //Add annotation
                    annotation.title = self.name[self.count]
                    annotation.subtitle = self.address[self.count]
                    self.count = self.count + 1
                    annotation.coordinate = location.coordinate
                    self.annotation.append(annotation)
                    self.total.addAnnotations(self.annotation)
                }
            }
                self.total.showAnnotations(self.annotation, animated: true)
        
        })
        }

    
    }

    
}
