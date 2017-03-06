//
//  ViewController.swift
//  Project01
//
//  Created by yaoyt on 2017/2/27.
//  Copyright © 2017年 yrhy. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]();
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Storm Viewer"

        let fm = FileManager.default;
        let path = Bundle.main.resourcePath!;
        let items = try! fm.contentsOfDirectory(atPath: path);
        for item in items {
//            print(item);
            if item.hasPrefix("nssl") {
                pictures.append(item);
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell");
        cell?.textLabel?.text = pictures[indexPath.row];
        return cell!;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailController.selectImage = pictures[indexPath.row];
            navigationController?.pushViewController(detailController, animated: true);
        }
    }


}

