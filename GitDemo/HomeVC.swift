//
//  HomeVC.swift
//  GitDemo
//
//  Created by Dark Bear on 08/09/17.
//  Copyright © 2017 Dark Bear. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {

    @IBOutlet weak var tabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view..
        addSlideMenuButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
