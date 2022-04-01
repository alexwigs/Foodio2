//
//  ResultsViewController.swift
//  Foodio
//
//  Created by Alex Wigsmoen on 3/23/22.
//

import UIKit
//import SwiftUI

class ResultsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var foodTextL: UILabel!
    @IBOutlet weak var lab: UILabel!
    
    @IBOutlet weak var reCal: UIButton!
    
    @IBOutlet weak var tabView: UITableView!
    
    var total: String?
    var summary: String?
    var z: String?
    var arr = [String]();
    //var foo: NSAttributedString
    
    //func up() {
        
        //let path = "https://mcdonalds.com"
        //let text = a.joined(separator: " ")
        //let h = t
        //let attr = NSAttributedString.makeHyperlink(for: path, in: text, as: "and")
        
    //}
    
    
    //let li = Link("hi", destination: URL(string: "https://mcdonalds.com")!)
    
    
   // let hpp = NSMutableAttributedString(string: "link")
    
    
    let im: [UIImage] = [#imageLiteral(resourceName: "mc.jpeg"),#imageLiteral(resourceName: "popeyes.png"),#imageLiteral(resourceName: "jim.jpeg")]
    

    let a = [("Mcdonalds: 708-567-8989\nhttps:mcdonalds.com"),
             ("Popeyes 103rd and kedzie 60546\n708-567-3282\nhttps:popeyes.com"),
             ("Jimmy Johns")]
    
    let b = [("Chick-Fil-A: 708-567-8989\nhttps:mcdonalds.com"),
             ("Canes 103rd and kedzie 60860\n708-567-3282\nhttps:popeyes.com"),
             ("Freddies")]
    
    let c = [("Sharks: 708-567-8989\nhttps:mcdonalds.com"),
             ("McDonalds 103rd and kedzie 60860\n708-567-3282\nhttps:popeyes.com"),
             ("Portillos")]
    
    //var n = [
      //  (Link("hi", destination: URL(string: "https://mcdonalds.com")!)),
        //(Link("hi", destination: URL(string: "https://mcdonalds.com")!)),
        //(Link("hi", destination: URL(string: "https://mcdonalds.com")!))]
    
    let d = [("Please enter a valid zip code and food!"),(""),("")]
    
    //var buttonHasNoText: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //struct Link<Label> where Label : ResultsViewController {
            
       // }
        
       // let li = Link("", destination: URL(string: "https://mcdonalds.com")!)
        
        
        reCal.layer.cornerRadius = 25.0
        reCal.layer.borderWidth = 2
        reCal.layer.borderColor = UIColor.white.cgColor
        reCal.tintColor = UIColor.white
        
        lab.text = total
      //  if buttonHasNoText == true {
        //    self.lab.text = total
          //  buttonHasNoText = false
        //} else {
          //  self.lab.text = ""
            //buttonHasNoText = true
        //}
        
        //if() {
            
          //  lab.text = ""
        //}
        
        foodTextL.text = summary
        
        // Do any additional setup after loading the view.
    }
    
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
       // let foo : Any
        
        //let t = cell.textLabel?.text
        
        //up(t: t ?? "")
        
        if(z == "60546") {
        
            ima = im [indexPath.row]
            food = a [indexPath.row]
            
           // foo = n [indexPath.row]
            
        } else if(z == "60324") {
            
            ima = im [indexPath.row]
            food = b [indexPath.row]
            //foo = n [indexPath.row]
        }
        else if(z == "60655") {
            
            ima = im [indexPath.row]
            food = c [indexPath.row]
           // foo = n [indexPath.row]

        } else {
            
            ima = im [indexPath.row]
            food = d [indexPath.row]
            //foo = n [indexPath.row]
        }
        
        cell.imageView?.image = ima
        cell.textLabel?.text = food
       // cell.detailTextLabel?.attributedText = foo as? NSAttributedString
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.init(name: "Chalkboard SE", size: 18)
        
        return cell
    }
    
   // func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
       // UIApplication.shared.open(URL)
        //return false
    //}

    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        
        self.dismiss(animated: true, completion: nil)
        
        //lab.text = nil
        //if buttonHasNoText {
          //  lab.text = total
           // buttonHasNoText = false
        //} else {
          //  lab.text = total
           // buttonHasNoText = true
        //}
        
    }
    
    

}
