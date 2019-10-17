//
//  DreamViewController.swift
//  dreamly
//
//  Created by Gonzalo Birrueta on 10/16/19.
//  Copyright © 2019 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class DreamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView:UITableView!
    
    
    var dreams = [
    
        Dream(dreamName: "Nightmare", date: "10/31/19", rating: 1.0),
        Dream(dreamName: "Crazy Dream", date: "10/20/19", rating: 3.0),
        Dream(dreamName: "Thrilling Dream", date: "10/24/19", rating: 5.0)
        
    ]
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        let tableBackColor = hexStringToUIColor(hex: "#202040")

        tableView.backgroundColor = tableBackColor
        
        let cellNib = UINib(nibName: "DreamTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "dreamCell")
        view.addSubview(tableView)

        var layoutGuide:UILayoutGuide!
        layoutGuide = view.safeAreaLayoutGuide
        
        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true

        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none


        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        let button = UIButton(frame: CGRect(x: 157, y: 622, width: 100, height: 100))
        let btnImage = UIImage(named: "addBtn.png")
        button.setImage(btnImage, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        self.view.addSubview(button)

    }
    
    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dreams.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dreamCell", for: indexPath) as! DreamTableViewCell
        cell.set(dream: dreams[indexPath.row])
        return cell
    }
    
    
    
    @objc func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }
}