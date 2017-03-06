//
//  DetailViewController.swift
//  Project01
//
//  Created by yaoyt on 2017/2/27.
//  Copyright © 2017年 yrhy. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectImage: String?;
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectImage;
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped));

        // Do any additional setup after loading the view.
        if let loadImage = selectImage {
            imageView.image = UIImage(named:loadImage);
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        navigationController?.hidesBarsOnTap = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        navigationController?.hidesBarsOnTap = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func shareTapped() {
//        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: []);
//        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem;
//        present(vc, animated: true);
        
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            vc.setInitialText("facebook init");
            vc.add(imageView.image);
            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"));
            present(vc, animated: true);


        }
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
