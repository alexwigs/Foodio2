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
    var f: String?
    var arr = [String]();
    var arr2 = [String]();
    
    
    // arrays of images
    // one array for each zip code
    let im: [UIImage] = [#imageLiteral(resourceName: "canesl.jpeg"),#imageLiteral(resourceName: "jaill.jpeg"),#imageLiteral(resourceName: "frythel.jpeg"),#imageLiteral(resourceName: "shakesh.jpeg")]
    let im1: [UIImage] = [#imageLiteral(resourceName: "pops.jpeg"),#imageLiteral(resourceName: "wonder.jpeg"),#imageLiteral(resourceName: "sub.jpeg"),#imageLiteral(resourceName: "waldo.jpeg")]
    let im2: [UIImage] = [#imageLiteral(resourceName: "mickeys.jpeg"),#imageLiteral(resourceName: "chop.jpeg"),#imageLiteral(resourceName: "kfc.jpeg"),#imageLiteral(resourceName: "oph.jpeg")]
    let im3: [UIImage] = [#imageLiteral(resourceName: "bart.jpeg"),#imageLiteral(resourceName: "gum.jpeg"),#imageLiteral(resourceName: "bk.jpeg"),#imageLiteral(resourceName: "hog.jpeg")]
    

    //arrays of restaurants.
    let a = [("Raising Cane's\n1106 Cicero Ave, Oak Lawn, IL, 60453\nhttps://www.raisingcanes.com/\n(708) 422-3736"),
             ("Jalisco Express Restaurant\n10846 S Cicero Ave, Oak Lawn, IL, 60453\nhttps://www.jaliscoexpressrestaurantofoaklawn.com/\n(708) 423-6476"),
             ("Fry the Coop\n5128 W 95th St, Oak Lawn, IL, 60453\nhttps://www.frythecoop.com/\n(708) 576-8645"),
             ("Shake Shack\n4071 W 95th St, Oak Lawn, IL, 60453\nhttps://www.shakeshack.com/home#/\n(708) 330-6530")]
    
    let b = [("Pop's Italian Beef\n10337 S Kedzie Ave, Chicago, IL, 60655\nhttps://www.popsbeef.com/location/chicago/\n(773) 239-1243"),
             ("WonderBurger Grill\n3333 West 111th St, Chicago, IL, 60655\nhttps://www.wonderburgerchicago.com/\n(773) 614-8336"),
             ("Subway\n10319 S Pulaski, Chicago, IL, 60655\nhttps://www.ordersubway.com/\n(773) 881-3424"),
             ("Waldo Cooney's Pizza\n2410 W 111th St, Chicago, IL, 60655\nhttps://www.waldocooneyspizza.com/\n(773) 825-8019")]
    
    let c = [("Mickey's Gyros\n15221 Cicero Ave, Oak Forest, IL, 60452\nhttps://www.mickeysgyrosoakforest.com/\n(708) 687-1400"),
             ("#1 Chop Suey\n15833 Central Ave, Oak Forest, IL, 60452\nhttps://www.oakforestchopsuey.com/\n(708) 687-8598"),
             ("KFC\n5301 W 159th St, Oak Forest, IL, 60452\nhttps://www.kfc.com/\n(708) 687-0858"),
             ("The Original Pancake House\n5140 159th St, Oak Forest, IL, 60452\nhttps://www.ophchiagoland.com/\n(708) 687-8282")]
    
    
    let d = [("Bartolini's\n14420 Pulaski Rd, Midlothian, IL, 60445\nhttps://www.bartolinis.com/\n(708) 396-2333"),
             ("Gum Wah Restaurant\n3700 147th St, Midlothian, IL, 60445\nhttps://www.gumwayrestaurant.com/\n(708) 389-1100"),
             ("Burger King\n14300 S Cicero Ave, Midlothian, IL, 60445\nhttps://www.bk.com/\n(708) 597-9520"),
             ("The Original Hog Wild\n14933 S Pulaski Rd, Midlothian, IL, 60445\nhttps://www.thehogwild.com/\n(708) 371-9005")]
    
    let e = [("Please enter a valid zip code and food!"),(""),(""),("")]
    
    let chick = [("Raising Canes:\nchicken fingers, texas toast, coleslaw, chicken sandwhich, cane's sauce"),("Fry the Coop:\nNashville Fried Chicken Sandwhich, messy fries, chicken and waffles, spicy butter chicken sandwhich, chicken and waffles")]
    
    let burger = [("Shake Shack:\nShack burger, cheeseburger, hamburger, hot dog, chocolate milk and cookies, grilled cheese")]
    
    let taco = [("Jalisco Express Restaurant:\ntacos (beef, steak, pork), taco dinner, tortas, horchata, quesadillas, nachos, fajitas, burrites, fried ice cream")]
    
    let beef = [("Pop's Italian Beef:\nsoup, Italian Beef Sandwhich, hamburger, cheeseburger, ribeye steak, double pizzaburger, hot dog")]
    
    let blt = [("WonderBurger Grill:\nwonderburger, cheeseburger, blt, patty melt, wonder dog, curly q fries, salad, milk shake"),("Subway:\nblt, all american sub, baja steak and jack sub, black forest ham sub, mozza meat wrap, roast beef wrap, personal pizza")]
    
    let sub = [("Subway:\nblt, all american sub, baja steak and jack sub, black forest ham sub, mozza meat wrap, roast beef wrap, personal pizza")]
    
    let pizza = [("Subway:\nblt, all american sub, baja steak and jack sub, black forest ham sub, mozza meat wrap, roast beef wrap, personal pizza"), ("Waldo Cooney's Pizza:\noriginal thin crust pizza, chicago style stuffed cheese pizza, surpreme pizza, vegetarian pizza, bbq chicken pizza, french fries, mozzarella stix, calzones")]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reCal.layer.cornerRadius = 25.0
        reCal.layer.borderWidth = 2
        reCal.layer.borderColor = UIColor.white.cgColor
        reCal.tintColor = UIColor.white
        
        //lab.text = total
        //seclab.text = total2
        
        //check which zip user entered and display correct arrays
        if(z == "60453") {
        
            switch f {
            case "chicken":
                lab.text = chick[0]
                seclab.text = chick[1]
            case "burger":
                lab.text = burger[0]
                seclab.text = ""
            case "taco":
                lab.text = taco[0]
                seclab.text = ""
            default:
                lab.text = "sorry this food is not in our database."
                seclab.text = ""
            }
            
        } else if(z == "60655") {
            
            switch f {
            case "beef":
                lab.text = beef[0]
                seclab.text = ""
            case "sub":
                lab.text = sub[0]
                seclab.text = ""
            case "pizza":
                lab.text = pizza[0]
                seclab.text = pizza[1]
            case "blt":
                lab.text = blt[0]
                seclab.text = blt[1]
            default:
                lab.text = "sorry this food is not in our database."
                seclab.text = ""
            }
        }
        else if(z == "60452") {
            
            

        } else if(z == "60445") {
            
            

        }
        
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
            
            ima = im1 [indexPath.row]
            food = b [indexPath.row]
            
        }
        else if(z == "60452") {
            
            ima = im2 [indexPath.row]
            food = c [indexPath.row]
            

        } else if(z == "60445") {
            
            ima = im3 [indexPath.row]
            food = d [indexPath.row]
            

        } else {
            
            ima = im [indexPath.row]
            food = e [indexPath.row]
            
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
