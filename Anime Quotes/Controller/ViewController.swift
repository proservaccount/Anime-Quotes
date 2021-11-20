//
//  ViewController.swift
//  Anime Quotes
//
//  Created by Tomas Sanni on 11/18/21.
//

import UIKit

class ViewController: UIViewController, QuoteManagerDelegate
{

    
    @IBOutlet weak var animeTitle: UILabel!
    @IBOutlet weak var animeCharacter: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    
    var quoteManager = QuoteManager()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        quoteManager.delegate = self
        quoteManager.performRequest()
    }

    
    
   
    
    func didUpdateQuote(quoteGoesHere: String, characterGoesHere: String, animeGoesHere: String) {
        DispatchQueue.main.async {
            self.quoteLabel.text = quoteGoesHere
            self.animeTitle.text = animeGoesHere
            self.animeCharacter.text = characterGoesHere

        }
    }
    

    
    @IBAction func changedQuotePressed(_ sender: UIButton)
    {
        quoteManager.performRequest()

    }
    
        

}

