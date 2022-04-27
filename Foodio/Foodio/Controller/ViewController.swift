//
//  ViewController.swift
//  Foodio
//
//  Created by Alex Wigsmoen on 3/21/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var zipText: UITextField!
    @IBOutlet weak var foodText: UITextField!
    @IBOutlet weak var findFoodBut: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    //all of our data structures
    var zipArr = [String]();
    var totalArr = [String]();
    var totalArr1 = [String]();
    var totalArr2 = [String]();
    var h = [String]();
    var foodarr = [String]();
    
    //emily and andrew
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //keyboard will block text field for zip code because the view is not a scroll view
        //can update this later after learning more about scroll views.
        setUp()
        
        
        // Do any additional setup after loading the view.
        
        //set error label to empty so user cant see it
        errorLabel.text = ""
        
        //format round buttons
        findFoodBut.layer.cornerRadius = 25.0
        findFoodBut.layer.borderWidth = 2
        findFoodBut.layer.borderColor = UIColor.white.cgColor
        findFoodBut.tintColor = UIColor.white
        
        
        //input file and put into a string
        
        let fileP = Bundle.main.path(forResource: "input", ofType: "txt")
        var myData = ""
        do {
            myData = try String(contentsOfFile: fileP!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print(error)
        }
        
        //put txt input from string into array
        h = myData.components(separatedBy: " ")
        
       // print(h)
        
        //split array into array for each restaraunt
        let g = h.split(separator: ",")
        
        
        //print(g)
        //create each individual restaraunt
        //let first = g[0]
        //let second = g[1]
        
        //for f in first {
          //  if f == foodText.text {
            //    print("yay")
              //  break
            //}
        //}
        
        //check to see if zip code is a valid restauraunt
        //if("" == "") {
            //if it is than return restaraunt
       // }
       // else if (second.contains("60834")){
            //check next retaraunt
            //cld actually possibly put this in a while loop
        //}
        //else {
            //tell user that zip code is not in database or scope
        //}
        
        var d = 0
        
        let zi = String(zipText.text ?? "")
        
        while (d < g.count) {
            //
            if g[d].contains(zi) {
            //    zipArr.append(contentsOf: g[d])
            }
            else {
               // print("wrong zip code")
            }
            
            d+=1
        }
        
        
        var i = 0
        
        let foo = String(foodText.text ?? "")
        
        let cod = foodText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        print(g)
        
        //check if input food is in restaurant
        while (i < g.count-1) {
            //if restaurant has food
            if g[i].contains(cod) {
                //display restaurant with food
                totalArr.append(contentsOf: g[i])
                print(totalArr)
                print("yay")
            }
            else {
                print("sorry no food for you")
                //totalArr.removeAll()
            }
            i += 1
        }
        
        //at the very end right before we validate fields
        //after total array is filled, split into 2 arrays to send to result.
        var ci = 0
        while (ci < totalArr.count-1) {
            
            if(ci < totalArr.count/2) {
                totalArr1.append(totalArr[ci])
                print(totalArr1)
            }
            
            else {
                totalArr2.append(totalArr[ci])
                print(totalArr2)
            }
            ci += 1
        }
        
        
        var j = 0
        
        var s = index(ofAccessibilityElement: " ")
        
        while (j < h.count) {
            //print(h[j])
            j += 1
        }
    }
    
    //andrew and eman
    
    //add done bar to keyboard so user can dismiss keyboard
    
    func setUp() {
        let bar = UIToolbar()
        
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMy))
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        bar.items = [space, space, done]
        bar.sizeToFit()
        
        zipText.inputAccessoryView = bar
        foodText.inputAccessoryView = bar
    }
    
    @objc func dismissMy(){
        view.endEditing(true)
    }
    
    
    //validate input
    
    
    func isValidFood(_ postalCode:String)->Bool {
            let postalcodeRegex = "^[a-zA-Z]{2,}$"
            let pinPredicate = NSPredicate(format: "SELF MATCHES %@", postalcodeRegex)
            let bool = pinPredicate.evaluate(with: postalCode) as Bool
            return bool
        }
    
    func isValidZip(_ postalCode:String)->Bool {
            let postalcodeRegex = "^[0-9]{5}(-[0-9]{4})?$"
            let pinPredicate = NSPredicate(format: "SELF MATCHES %@", postalcodeRegex)
            let bool = pinPredicate.evaluate(with: postalCode) as Bool
            return bool
        }
   
   
    
    
    // check fields and validate data is correct. if everything is correct
    // method returns nil, if not return error message.
    
    //alex and emily
    
    func validateFields() -> String? {
        
        // check all fields are filled
        if foodText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            zipText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            
            return "please fill in all fields"
        }
        
        // check if data is valid
        let cleanFood = foodText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanZip = zipText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if isValidFood(cleanFood) == false {
            // food is not valid
            return "please enter a valid food"
        }
        
        if isValidZip(cleanZip) == false {
            // zip is not valid
            return "please enter a valid zip"
        }
        
        
        // check if food and zip code is in database
        if h.contains(cleanZip) {
            //food is in database
            //print("zip is valid")
        }
        else {
            return "Zip code not in database"
        }
        
        if h.contains(cleanFood) {
            //food is in database
            //print("food is valid")
        }
        else {
            return "food not in database"
        }
        
        
        return nil
    }
    
    
    //not sure if this does something, but leave here just in case
    func transitionToResults() {
        
        let reultsViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.resultsViewController) as? ResultsViewController
        
        view.window?.rootViewController = reultsViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    
    //most likely wont use this method but leave here just in case
    //this method excecutes when find food is pressed
    @IBAction func findFoodPressed(_ sender: UIButton) {
        
        
    }
    
    //transitions to result page if user enters valid input
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let error = validateFields()
        
        if error != nil {
            
            // there is something wrong show error message
            
            errorLabel.text = error
            
            return false
            
        }
        else {
            errorLabel.text = ""
            return true
        }
    }
    
    //alex and andrew
    
    //this method sends the final arrays to the results page
    //also gives results page access to zip code and food entry
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            
            let clzip = zipText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let clfoo = foodText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let destinationVC = segue.destination as! ResultsViewController
            //destinationVC.total = String(format: "" , totalArr)
            
            //send to split arrays to result page
            //destinationVC.total = totalArr1.joined(separator: " ")
            //destinationVC.total2 = totalArr2.joined(separator: " ")
            
            destinationVC.z = clzip
            destinationVC.f = clfoo
            destinationVC.arr = totalArr
            
            //print(destinationVC.arr)
            
            destinationVC.summary = "Food entered: \(foodText.text ?? ""), for zip code: \(zipText.text ?? "")"
            
            
        }
        
        
    }
    
    

}



