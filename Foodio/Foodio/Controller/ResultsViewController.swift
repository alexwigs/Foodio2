//
//  ResultsViewController.swift
//  Foodio
//
//  Created by Alex Wigsmoen on 3/23/22.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var foodTextL: UILabel!
    @IBOutlet weak var lab: UILabel!
    @IBOutlet weak var seclab: UILabel!
    
    @IBOutlet weak var reCal: UIButton!
    
    @IBOutlet weak var tabView: UITableView!
    
    var total: String?
    var total2: String?
    var summary: String?
    var z: String?
    var arr = [String]();
    var arr2 = [String]();
    
    
    // arrays of images
    // will need three, one for each zip code
    let im: [UIImage] = [#imageLiteral(resourceName: "initialpop.jpeg"),#imageLiteral(resourceName: "initialpop.jpeg"),#imageLiteral(resourceName: "initialpop.jpeg")]
    

    //arrays of restaurants.
    let a = [("Mcdonalds: 708-567-8989\nhttps:mcdonalds.com"),
             ("Popeyes 103rd and kedzie 60546\n708-567-3282\nhttps:popeyes.com"),
             ("Jimmy Johns")]
    
    let b = [("Chick-Fil-A: 708-567-8989\nhttps:mcdonalds.com"),
             ("Canes 103rd and kedzie 60860\n708-567-3282\nhttps:popeyes.com"),
             ("Freddies")]
    
    let c = [("Sharks: 708-567-8989\nhttps:mcdonalds.com"),
             ("McDonalds 103rd and kedzie 60860\n708-567-3282\nhttps:popeyes.com"),
             ("Portillos")]
    
    
    let d = [("Please enter a valid zip code and food!"),(""),("")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reCal.layer.cornerRadius = 25.0
        reCal.layer.borderWidth = 2
        reCal.layer.borderColor = UIColor.white.cgColor
        reCal.tintColor = UIColor.white
        
        lab.text = total
        seclab.text = total2
        
        foodTextL.text = summary
        
        // Do any additional setup after loading the view.
    }
    
    //set up the table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return a.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        var cell = UITableViewCell()
        var food : String
        var ima : UIImage
        
        //check which zip user entered and display correct arrays
        if(z == "60546") {
        
            ima = im [indexPath.row]
            food = a [indexPath.row]
            
            
        } else if(z == "60324") {
            
            ima = im [indexPath.row]
            food = b [indexPath.row]
            
        }
        else if(z == "60655") {
            
            ima = im [indexPath.row]
            food = c [indexPath.row]
            

        } else {
            
            ima = im [indexPath.row]
            food = d [indexPath.row]
            
        }
        
        cell.imageView?.image = ima
        cell.textLabel?.text = food
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.init(name: "Chalkboard SE", size: 18)
        
        return cell
    }
    

    
    // when user presses find new food button, go back to first page
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    

}
