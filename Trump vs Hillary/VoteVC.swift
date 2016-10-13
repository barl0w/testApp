//
//  VoteVC.swift
//  Trump vs Hillary
//
//  Created by Scott Barlow on 10/12/16.
//  Copyright © 2016 Team Apps. All rights reserved.
//

import UIKit
import GoogleMobileAds

class VoteVC: UIViewController {

    @IBOutlet weak var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // AdMob Initialization:
        // App ID: ca-app-pub-8625776473820420~6307822794
        // Ad unit ID: ca-app-pub-8625776473820420/ <------ Use this below
        
        // Test ad unit ID: ca-app-pub-3940256099942544/2934735716
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        UIApplication.shared.statusBarStyle = .lightContent
//    }

}
