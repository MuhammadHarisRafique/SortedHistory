//
//  ViewController.swift
//  JobHistory
//
//  Created by Higher Visibility on 25/01/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var progress: UIButton!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var booked = ["booked","booked","booked","booked","booked","booked","booked","booked"]
    var cancel = ["cancelled","cancelled","cancelled","cancelled","cancelled","cancelled","cancelled"]
    var progressJob = ["progress","progress","progress","progress","progress","progress","progress","progress"]
    var array:[String] = []
    var underline = UILabel()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.array = self.booked
        self.makeunderline(button: self.booking_Pressed)
        
        
       
    }

    private func makeunderline(button:UIButton){
        
        self.underline.removeFromSuperview()
        let frame = CGRect(x: button.frame.minX, y: button.frame.maxY, width: button.frame.width, height: 3)
        self.underline.frame = frame
        self.underline.layer.backgroundColor = UIColor.white.cgColor
        self.navBarView.addSubview(self.underline)
        
        
    }
    
    @IBOutlet weak var booking_Pressed: UIButton!
    @IBOutlet weak var cancelled: UIButton!
    
    
    @IBAction func booking_Pressed(_ sender: UIButton) {
        self.array = []
        self.array = self.booked
        self.tableView.reloadData()
        self.makeunderline(button: self.booking_Pressed)
    }
    
    @IBAction func cancelled_pressed(_ sender: UIButton) {
        self.array = []
        self.array = self.cancel
        self.tableView.reloadData()
         self.makeunderline(button: self.cancelled)
    }
    
    @IBAction func progress_Pressed(_ sender: UIButton) {
        self.array = []
        self.array = self.progressJob
        self.tableView.reloadData()
         self.makeunderline(button: self.progress)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.array[indexPath.row]
        cell?.textLabel?.textColor = UIColor.black
        return cell!
    }
    
}

