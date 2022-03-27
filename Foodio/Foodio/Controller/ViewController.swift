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
    
    var zipArr = [String]();
    var totalArr = [String]();
    var h = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        errorLabel.text = ""
        
        findFoodBut.layer.cornerRadius = 25.0
        findFoodBut.layer.borderWidth = 2
        findFoodBut.layer.borderColor = UIColor.white.cgColor
        findFoodBut.tintColor = UIColor.white
        
        //findFoodBut.isEnabled = false
        
        //zipText.delegate = self
        //foodText.delegate = self
        
        
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
        print(g)
        
        //check if input food is in restaurant
        while (i < g.count-1) {
            //if restaurant has food
            if g[i].contains("is") {
                //display restaurant with food
                totalArr.append(contentsOf: g[i])
                print(totalArr)
                print("yay")
            }
            else {
                print("sorry no food for you")
                totalArr.removeAll()
            }
            i += 1
        }
        
        
        //check to see if value input is in restauraunt
        //if second.contains(foo) {
            //if it is return restauraunt array
            //print("amazing")
        //}
        //else {
            //dont return anything or check next restaurant array
          //  print("nah man")
        //}
        
        //let fir: [[String]] = h.split(separator: "").map{Array($0)}
       // print(first)
        //print(second)
        
        var j = 0
        
        var s = index(ofAccessibilityElement: " ")
        
        while (j < h.count) {
            //print(h[j])
            j += 1
        }
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
    
    func transitionToResults() {
        
        let reultsViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.resultsViewController) as? ResultsViewController
        
        view.window?.rootViewController = reultsViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    
    @IBAction func findFoodPressed(_ sender: UIButton) {
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let error = validateFields()
        
        if error != nil {
            
            // there is something wrong show error message
            //findFoodBut.isEnabled = false
            errorLabel.text = error
            
            return false
            
        }
        else {
            errorLabel.text = ""
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! ResultsViewController
            //destinationVC.total = String(format: "" , totalArr)
            destinationVC.total = totalArr.joined(separator: " ")
            destinationVC.z = zipText.text
            destinationVC.arr = totalArr
            //print(destinationVC.arr)
            destinationVC.summary = "Food entered: \(foodText.text ?? "") for zip code: \(zipText.text ?? "")"
            
            
        }
        
        
    }
    
    
    //var myData = readFile(inputfile: "input.txt")

}



//extension String {
    //get file name from string
  //  func fileName() -> String {
    //    return URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
    //}
    
    //get file extension
   // func fileExtension() -> String {
     //   return URL(fileURLWithPath: self).pathExtension
    //}
//}

//func readFile(inputfile : String) -> String {
    //split file extension and file name
 //   let fileExtension = inputfile.fileExtension()
   // let fileName = inputfile.fileName()
    
    //get file url
    //let fileURL = try! FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
    //let inputFile = fileURL.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
    
    //get the data
   // do{
     //   let savedData = try String(contentsOf: inputFile)
       // return savedData
    //} catch {
      //  return error.localizedDescription
  //  }
//}


