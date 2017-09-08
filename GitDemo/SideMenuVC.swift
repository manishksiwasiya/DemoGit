//
//  ViewController.swift
//  GitDemo
//
//  Created by Dark Bear on 07/09/17.
//  Copyright © 2017 Dark Bear. All rights reserved.
//

import UIKit

protocol SideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class SideMenuVC: UIViewController {

    @IBOutlet var tblMenu: UITableView!
    
    var arrMenuItems = NSMutableArray()
    
    var delegate : SideMenuDelegate?
    
    @IBOutlet var btnCloseMenuOverlay : UIButton!

    var btnMenu : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        arrMenuItems = ["Home", "Profile", "Settings", "Logout"]
        
        tblMenu.register(UINib.init(nibName: "MenuItemCell", bundle: nil), forCellReuseIdentifier: "MyCustomCell")
        tblMenu.tableFooterView = UIView()
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SideMenuVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        self.onCloseMenuClick(btn)
    }
}

extension SideMenuVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var menuCell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell") as? MenuItemCell
        
        if(menuCell == nil) {
            menuCell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell") as? MenuItemCell
        }
        
        menuCell?.lblMenuOption.text = (arrMenuItems[indexPath.row] as! String)
        
        return menuCell!
    }
}
