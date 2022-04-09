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
    let im: [UIImage] = [#imageLiteral(resourceName: "canesl.jpeg"),#imageLiteral(resourceName: "jaill.jpeg"),#imageLiteral(resourceName: "frythel.jpeg"),#imageLiteral(resourceName: "shakesh.jpeg")]
    

    //arrays of restaurants.
    let a = [("Raising Cane's\nOak Lawn, IL, 60453\nhttps://www.raisingcanes.com/\n(708) 422-3736"),
             ("Jalisco Express Restaurant\nOak Lawn, IL, 60453\nhttps://www.jaliscoexpressrestaurantofoaklawn.com/\n(708) 423-6476"),
             ("Fry the Coop\nOak Lawn, IL, 60453\nhttps://www.frythecoop.com/\n(708) 576-8645"),
             ("Shake Shack\nOak Lawn, IL, 60453\nhttps://www.shakeshack.com/home#/\n(708) 330-6530")]
    
    let b = [("Pop's Italian Beef\nChicago, IL, 60655\nhttps://www.popsbeef.com/location/chicago/\n(773) 239-1243"),
             ("Wonder Burger Grill\nChicago, IL, 60655\nhttps://www.wonderburgerchicago.com/\n(773) 614-8336"),
             ("Subway\nChicago, IL, 60655\nhttps://www.ordersubway.com/\n(773) 881-3424"),
             ("Waldo Cooney's Pizza\nChicago, IL, 60655\nhttps://www.waldocooneyspizza.com/\n(773) 825-8019")]
    
    let c = [("Mickey's Gyros\nOak Forest, IL, 60452\nhttps://www.mickeysgyrosoakforest.com/\n(708) 687-1400"),
             ("#1 Chop Suey\nOak Forest, IL, 60452\nhttps://www.oakforestchopsuey.com/\n(708) 687-8598"),
             ("KFC\nOak Forest, IL, 60452\nhttps://www.kfc.com/\n(708) 687-0858"),
             ("The Original Pancake House\nOak Forest, IL, 60452\nhttps://www.ophchiagoland.com/\n(708) 687-8282")]
    
    
    let d = [("Please enter a valid zip code and food!"),(""),(""),("")]
    
    
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
        if(z == "60453") {
        
            ima = im [indexPath.row]
            food = a [indexPath.row]
            
            
        } else if(z == "60655") {
            
            ima = im [indexPath.row]
            food = b [indexPath.row]
            
        }
        else if(z == "60452") {
            
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
