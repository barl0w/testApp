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
    
    // Outlets
    
        // Thumbs Up Button
    
    @IBOutlet weak var hillaryVoteButton: CustomButton!
    @IBOutlet weak var trumpVoteButton: CustomButton!
    @IBOutlet weak var johnsonVoteButton: CustomButton!
    @IBOutlet weak var steinVoteButton: CustomButton!
    @IBOutlet weak var mcMullinVoteButton: CustomButton!
    
        // Ad Banner View
    
    @IBOutlet weak var bannerView: GADBannerView!
    
        // Vote & Voted Text
    
    @IBOutlet weak var hillaryVoteText: UILabel!
    @IBOutlet weak var hillaryVotedText: UILabel!
    
    @IBOutlet weak var trumpVoteText: UILabel!
    @IBOutlet weak var trumpVotedText: UILabel!
    
    @IBOutlet weak var johnsonVoteText: UILabel!
    @IBOutlet weak var johnsonVotedText: UILabel!
    
    @IBOutlet weak var steinVoteText: UILabel!
    @IBOutlet weak var steinVotedText: UILabel!
    
    @IBOutlet weak var mcMullinVoteText: UILabel!
    @IBOutlet weak var mcMullinVotedText: UILabel!
    
        // Vote Count Text
    
    @IBOutlet weak var hillaryVoteCount: UILabel!
    @IBOutlet weak var trumpVoteCount: UILabel!
    @IBOutlet weak var johnsonVoteCount: UILabel!
    @IBOutlet weak var steinVoteCount: UILabel!
    @IBOutlet weak var mcMullinVoteCount: UILabel!
    
    // Variables
    
        // Set these varibles to the number that is in Firebase. Pull the total votes for each candidate while still in the previous VC and then passing it to this VC and variables.
    
    var votesForHillary: Int = 0
    var votesForTrump: Int = 0
    var votesForJohnson: Int = 0
    var votesForStein: Int = 0
    var votesForMcMullin: Int = 0
    
    var myOneVote: Int = 0
    
    /////

    override func viewDidLoad() {
        super.viewDidLoad()

            // Initialize Google Ads
        
        // AdMob Initialization:
        // App ID: ca-app-pub-8625776473820420~6307822794
        // Ad unit ID: ca-app-pub-8625776473820420/ <------ Use this below
        
        // Test ad unit ID: ca-app-pub-3940256099942544/2934735716
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
            // Initialize Voted Text Label
        
        self.hillaryVotedText.isHidden = true
        self.trumpVotedText.isHidden = true
        self.johnsonVotedText.isHidden = true
        self.steinVotedText.isHidden = true
        self.mcMullinVotedText.isHidden = true
        
            // Initalize Candidate Vote Count Label
        
        self.hillaryVoteCount.text = String(self.votesForHillary)
        self.trumpVoteCount.text = String(self.votesForTrump)
        self.johnsonVoteCount.text = String(self.votesForJohnson)
        self.steinVoteCount.text = String(self.votesForStein)
        self.mcMullinVoteCount.text = String(self.votesForMcMullin)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func voteForHillaryButton(_ sender: AnyObject) {
        
        if self.hillaryVoteButton.currentImage == #imageLiteral(resourceName: "like") {
            
            self.hillaryVoteButton.setImage(#imageLiteral(resourceName: "like-filled"), for: .normal)
            
            self.myOneVote = 1
            self.votesForHillary += self.myOneVote
            self.hillaryVoteCount.text = String(self.votesForHillary)
        
            self.trumpVoteButton.isEnabled = false
            self.johnsonVoteButton.isEnabled = false
            self.steinVoteButton.isEnabled = false
            self.mcMullinVoteButton.isEnabled = false
            
            self.hillaryVoteText.isHidden = true
            self.trumpVoteText.isHidden = true
            self.johnsonVoteText.isHidden = true
            self.steinVoteText.isHidden = true
            self.mcMullinVoteText.isHidden = true
            
            self.hillaryVotedText.isHidden = false
            
        } else {
            
            let alertController = UIAlertController(title: "Change your vote?", message: "This will remove the vote for this candidate. Press Cancel to go back now", preferredStyle: UIAlertControllerStyle.alert)
            
            let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                print("Cancel")
            }
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                print("Vote has been removed by user")
                
                self.hillaryVoteButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
                
                if self.myOneVote == 1 {
                
                    self.votesForHillary -= self.myOneVote
                    self.hillaryVoteCount.text = String(self.votesForHillary)
                    
                    self.trumpVoteButton.isEnabled = true
                    self.johnsonVoteButton.isEnabled = true
                    self.steinVoteButton.isEnabled = true
                    self.mcMullinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                    self.myOneVote = 0
                    
                } else if self.myOneVote == 0 {
                    
                    self.hillaryVoteCount.text = String(self.votesForHillary)
                    
                    self.trumpVoteButton.isEnabled = true
                    self.johnsonVoteButton.isEnabled = true
                    self.steinVoteButton.isEnabled = true
                    self.mcMullinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                } else if self.myOneVote < 0 || self.myOneVote > 1 {
                    
                    self.myOneVote = 1
                    
                    self.votesForHillary -= self.myOneVote
                    self.hillaryVoteCount.text = String(self.votesForHillary)
                    
                    self.trumpVoteButton.isEnabled = true
                    self.johnsonVoteButton.isEnabled = true
                    self.steinVoteButton.isEnabled = true
                    self.mcMullinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                    self.myOneVote = 0
                    
                }
                
            }
            
            alertController.addAction(CancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func voteForTrumpButton(_ sender: AnyObject) {
        
        if self.trumpVoteButton.currentImage == #imageLiteral(resourceName: "like") {
            
            self.trumpVoteButton.setImage(#imageLiteral(resourceName: "like-filled"), for: .normal)
            
            self.myOneVote = 1
            self.votesForTrump += self.myOneVote
            self.trumpVoteCount.text = String(self.votesForTrump)
            
            self.hillaryVoteButton.isEnabled = false
            self.johnsonVoteButton.isEnabled = false
            self.steinVoteButton.isEnabled = false
            self.mcMullinVoteButton.isEnabled = false
            
            self.hillaryVoteText.isHidden = true
            self.trumpVoteText.isHidden = true
            self.johnsonVoteText.isHidden = true
            self.steinVoteText.isHidden = true
            self.mcMullinVoteText.isHidden = true
            
            self.trumpVotedText.isHidden = false
            
        } else {
            
            let alertController = UIAlertController(title: "Change your vote?", message: "This will remove the vote for this candidate. Press Cancel to go back now", preferredStyle: UIAlertControllerStyle.alert)
            
            let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                print("Cancel")
            }
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                print("Vote has been removed by user")
            
                self.trumpVoteButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
                
                if self.myOneVote == 1 {
                
                    self.votesForTrump -= self.myOneVote
                    self.trumpVoteCount.text = String(self.votesForTrump)
                    
                    self.hillaryVoteButton.isEnabled = true
                    self.johnsonVoteButton.isEnabled = true
                    self.steinVoteButton.isEnabled = true
                    self.mcMullinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                    self.myOneVote = 0
                    
                } else if self.myOneVote == 0 {
                 
                    self.trumpVoteCount.text = String(self.votesForTrump)
                    
                    self.hillaryVoteButton.isEnabled = true
                    self.johnsonVoteButton.isEnabled = true
                    self.steinVoteButton.isEnabled = true
                    self.mcMullinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                } else if self.myOneVote < 0 || self.myOneVote > 1 {
                    
                    self.myOneVote = 1
                    
                    self.votesForTrump -= self.myOneVote
                    self.trumpVoteCount.text = String(self.votesForTrump)
                    
                    self.hillaryVoteButton.isEnabled = true
                    self.johnsonVoteButton.isEnabled = true
                    self.steinVoteButton.isEnabled = true
                    self.mcMullinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                    self.myOneVote = 0
                    
                }
                
            }
            
            alertController.addAction(CancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func voteForJohnsonButton(_ sender: AnyObject) {
        
        if self.johnsonVoteButton.currentImage == #imageLiteral(resourceName: "like") {
            
            self.johnsonVoteButton.setImage(#imageLiteral(resourceName: "like-filled"), for: .normal)
            
            self.myOneVote = 1
            self.votesForJohnson += self.myOneVote
            self.johnsonVoteCount.text = String(self.votesForJohnson)
            
            self.hillaryVoteButton.isEnabled = false
            self.trumpVoteButton.isEnabled = false
            self.steinVoteButton.isEnabled = false
            self.mcMullinVoteButton.isEnabled = false
            
            self.hillaryVoteText.isHidden = true
            self.trumpVoteText.isHidden = true
            self.johnsonVoteText.isHidden = true
            self.steinVoteText.isHidden = true
            self.mcMullinVoteText.isHidden = true
            
            self.johnsonVotedText.isHidden = false
            
        } else {
            
            let alertController = UIAlertController(title: "Change your vote?", message: "This will remove the vote for this candidate. Press Cancel to go back now", preferredStyle: UIAlertControllerStyle.alert)
            
            let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                print("Cancel")
            }
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                print("Vote has been removed by user")
            
                self.johnsonVoteButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
                
                if self.myOneVote == 1 {
                
                    self.votesForJohnson -= self.myOneVote
                    self.johnsonVoteCount.text = String(self.votesForJohnson)
                    
                    self.hillaryVoteButton.isEnabled = true
                    self.trumpVoteButton.isEnabled = true
                    self.steinVoteButton.isEnabled = true
                    self.mcMullinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                    self.myOneVote = 0
                    
                } else if self.myOneVote == 0 {
                    
                    self.johnsonVoteCount.text = String(self.votesForJohnson)
                    
                    self.hillaryVoteButton.isEnabled = true
                    self.trumpVoteButton.isEnabled = true
                    self.steinVoteButton.isEnabled = true
                    self.mcMullinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                } else if self.myOneVote < 0 || self.myOneVote > 1 {
                    
                    self.votesForJohnson -= self.myOneVote
                    self.johnsonVoteCount.text = String(self.votesForJohnson)
                    
                    self.hillaryVoteButton.isEnabled = true
                    self.trumpVoteButton.isEnabled = true
                    self.steinVoteButton.isEnabled = true
                    self.mcMullinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                    self.myOneVote = 0
                    
                }
                
            }
            
            alertController.addAction(CancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func voteForSteinButton(_ sender: AnyObject) {
        
        if self.steinVoteButton.currentImage == #imageLiteral(resourceName: "like") {
            
            self.steinVoteButton.setImage(#imageLiteral(resourceName: "like-filled"), for: .normal)
            
            self.myOneVote = 1
            self.votesForStein += self.myOneVote
            self.steinVoteCount.text = String(self.votesForStein)
            
            self.hillaryVoteButton.isEnabled = false
            self.trumpVoteButton.isEnabled = false
            self.johnsonVoteButton.isEnabled = false
            self.mcMullinVoteButton.isEnabled = false
            
            self.hillaryVoteText.isHidden = true
            self.trumpVoteText.isHidden = true
            self.johnsonVoteText.isHidden = true
            self.steinVoteText.isHidden = true
            self.mcMullinVoteText.isHidden = true
            
            self.steinVotedText.isHidden = false
            
        } else {
            
            let alertController = UIAlertController(title: "Change your vote?", message: "This will remove the vote for this candidate. Press Cancel to go back now", preferredStyle: UIAlertControllerStyle.alert)
            
            let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                print("Cancel")
            }
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                print("Vote has been removed by user")
            
                self.steinVoteButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
                
                if self.myOneVote == 1 {
                    
                    self.votesForStein -= self.myOneVote
                    self.steinVoteCount.text = String(self.votesForStein)
                    
                    self.hillaryVoteButton.isEnabled = true
                    self.trumpVoteButton.isEnabled = true
                    self.johnsonVoteButton.isEnabled = true
                    self.mcMullinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                    self.myOneVote = 0
                    
                } else if self.myOneVote == 0 {
                    
                    self.steinVoteCount.text = String(self.votesForStein)
                    
                    self.hillaryVoteButton.isEnabled = true
                    self.trumpVoteButton.isEnabled = true
                    self.johnsonVoteButton.isEnabled = true
                    self.mcMullinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                } else if self.myOneVote < 0 || self.myOneVote > 1 {
                    
                    self.myOneVote = 1
                    
                    self.votesForStein -= self.myOneVote
                    self.steinVoteCount.text = String(self.votesForStein)
                    
                    self.hillaryVoteButton.isEnabled = true
                    self.trumpVoteButton.isEnabled = true
                    self.johnsonVoteButton.isEnabled = true
                    self.mcMullinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                    self.myOneVote = 0
                    
                }
                
            }
            
            alertController.addAction(CancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func voteForMcMullinButton(_ sender: AnyObject) {
        
        if self.mcMullinVoteButton.currentImage == #imageLiteral(resourceName: "like") {
            
            self.mcMullinVoteButton.setImage(#imageLiteral(resourceName: "like-filled"), for: .normal)
            
            self.myOneVote = 1
            self.votesForMcMullin += self.myOneVote
            self.mcMullinVoteCount.text = String(self.votesForMcMullin)
            
            self.hillaryVoteButton.isEnabled = false
            self.trumpVoteButton.isEnabled = false
            self.johnsonVoteButton.isEnabled = false
            self.steinVoteButton.isEnabled = false
            
            self.hillaryVoteText.isHidden = true
            self.trumpVoteText.isHidden = true
            self.johnsonVoteText.isHidden = true
            self.steinVoteText.isHidden = true
            self.mcMullinVoteText.isHidden = true
            
            self.mcMullinVotedText.isHidden = false
            
        } else {
            
            let alertController = UIAlertController(title: "Change your vote?", message: "This will remove the vote for this candidate. Press Cancel to go back now", preferredStyle: UIAlertControllerStyle.alert)
            
            let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                print("Cancel")
            }
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                print("Vote has been removed by user")
            
                self.mcMullinVoteButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
                
                if self.myOneVote == 1 {
                    
                    self.votesForMcMullin -= self.myOneVote
                    self.mcMullinVoteCount.text = String(self.votesForMcMullin)
                    
                    self.hillaryVoteButton.isEnabled = true
                    self.trumpVoteButton.isEnabled = true
                    self.johnsonVoteButton.isEnabled = true
                    self.steinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                    self.myOneVote = 0
                    
                } else if self.myOneVote == 0 {
                    
                    self.mcMullinVoteCount.text = String(self.votesForMcMullin)
                    
                    self.hillaryVoteButton.isEnabled = true
                    self.trumpVoteButton.isEnabled = true
                    self.johnsonVoteButton.isEnabled = true
                    self.steinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                } else if self.myOneVote < 0 || self.myOneVote > 1 {
                    
                    self.myOneVote = 1
                    
                    self.votesForMcMullin -= self.myOneVote
                    self.mcMullinVoteCount.text = String(self.votesForMcMullin)
                    
                    self.hillaryVoteButton.isEnabled = true
                    self.trumpVoteButton.isEnabled = true
                    self.johnsonVoteButton.isEnabled = true
                    self.steinVoteButton.isEnabled = true
                    
                    self.hillaryVoteText.isHidden = false
                    self.trumpVoteText.isHidden = false
                    self.johnsonVoteText.isHidden = false
                    self.steinVoteText.isHidden = false
                    self.mcMullinVoteText.isHidden = false
                    
                    self.hillaryVotedText.isHidden = true
                    self.trumpVotedText.isHidden = true
                    self.johnsonVotedText.isHidden = true
                    self.steinVotedText.isHidden = true
                    self.mcMullinVotedText.isHidden = true
                    
                    self.myOneVote = 0
                    
                }
                
            }
            
            alertController.addAction(CancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    // Send user to candidate website
    
    @IBAction func sendToHillaryWebsite(_ sender: AnyObject) {
        
        print("Send to Hillary website")
        
        let url = URL(string: "http://www.hillaryclinton.com")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    @IBAction func sendToTrumpWebsite(_ sender: AnyObject) {
        
        print("Send to Trump website")
        
        let url = URL(string: "http://www.donaldjtrump.com")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    @IBAction func sendToJohnsonWebsite(_ sender: AnyObject) {
        
        print("Send to Johnson website")
        
        let url = URL(string: "https://johnsonweld.com")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    @IBAction func sendToSteinWebsite(_ sender: AnyObject) {
        
        print("Send to Stein website")
        
        let url = URL(string: "http://www.jill2016.com")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    @IBAction func sendToMcMullinWebsite(_ sender: AnyObject) {
        
        print("Send to McMullin website")
        
        let url = URL(string: "http://www.evanmcmullin.com")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
}
