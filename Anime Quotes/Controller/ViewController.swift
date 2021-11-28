//
//  ViewController.swift
//  Anime Quotes
//
//  Created by Tomas Sanni on 11/18/21.
//

import UIKit

class ViewController: UIViewController, QuoteManagerDelegate
{
 
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var animeTitle: UILabel!
    @IBOutlet weak var animeCharacter: UILabel!
    @IBOutlet weak var newQuoteText: UITextView!
    
    var quoteManager = QuoteManager()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.orange.cgColor, UIColor.white.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        changeButton.layer.cornerRadius = 20
        
        
        quoteManager.delegate = self
        quoteManager.performRequest()
        
        
    }

    
    
   
    //Will change the text on UI based on JSON data returned 
    func didUpdateQuote(quoteGoesHere: String, characterGoesHere: String, animeGoesHere: String) {
        DispatchQueue.main.async {
            self.newQuoteText.text = quoteGoesHere
            self.animeTitle.text = "Anime: \(animeGoesHere)"
            self.animeCharacter.text = "Character: \(characterGoesHere)"

        }
    }
    

    //Each time button is pressed
    @IBAction func changedQuotePressed(_ sender: UIButton)
    {
        quoteManager.performRequest()

    }
    
        

}

