//
//  LoginVC.swift
//  GitDemo
//
//  Created by Dark Bear on 08/09/17.
//  Copyright © 2017 Dark Bear. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Initialize Configuration
        var configuration = Configuration()
        
        print(configuration.environment.baseURL)
        print(configuration.environment.token)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let str = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if textField == txtPhoneNumber{
            
            let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
            let compSepByCharInSet = string.components(separatedBy: aSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            
            if string == numberFiltered {
                return checkEnglishPhoneNumberFormat(string: string, str: str)
            }
            return false
            
        }else{
            
            return true
        }
    }
    
    func formatNumber(mobileNumber: String) -> String {
        var resultPh = mobileNumber
        resultPh = resultPh.replacingOccurrences(of: "(", with: "")
        resultPh = resultPh.replacingOccurrences(of: ")", with: "")
        resultPh = resultPh.replacingOccurrences(of: " ", with: "")
        resultPh = resultPh.replacingOccurrences(of: "-", with: "")
        resultPh = resultPh.replacingOccurrences(of: "+", with: "")
        
        print(resultPh);
        
        let length = resultPh.characters.count
        
        if length > 10
        {
            let index = resultPh.index(resultPh.startIndex, offsetBy: length - 10)
            resultPh = resultPh.substring(to: index)
            print(resultPh);
        }
        return resultPh;
    }
    
    func checkEnglishPhoneNumberFormat(string: String?, str: String?) -> Bool{
        
        if string == ""{ //BackSpace
            
            return true
            
        }else if str!.characters.count < 3{
            
            if str!.characters.count == 1{
                
                txtPhoneNumber.text = "("
            }
            
        }else if str!.characters.count == 5{
            
            txtPhoneNumber.text = txtPhoneNumber.text! + ") "
            
        }else if str!.characters.count == 10{
            
            txtPhoneNumber.text = txtPhoneNumber.text! + "-"
            
        }else if str!.characters.count > 14{
            
            return false
        }
        
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
