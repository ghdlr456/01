
import UIKit

class myTableViewController: UITableViewController {
    
    var foodStoreName = ["늘해랑", "번개반점"]
    var foodStoreAddress = ["부산광역시 부산진구 양정1동 358-1", "부산광역시 부산진구 양정1동 418-237"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodStoreName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Re", for: indexPath) as! TableViewCell

        cell.Name.text = foodStoreName[indexPath.row]
        cell.address.text = foodStoreAddress[indexPath.row]
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapview"{
            if let indexpath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! MapViewController
                
                destinationController.name = foodStoreName[indexpath.row]
                destinationController.address = foodStoreAddress[indexpath.row]
                
                
            }
            
        }
        
    }
    

}
