//
//  ByAnimeQuoteScreenController.swift
//  Anime Quotes
//
//  Created by Tomas Sanni on 12/1/21.
//

import UIKit

class ByAnimeQuoteScreenController: UIViewController, ByAnimeQuoteManagerDelegate
{
    func updatePickerView(numOfSlots: Int) {
        nums = numOfSlots
    }
    
    
    var nums: Int = 0
    
    @IBOutlet weak var animeTitle: UILabel!
    @IBOutlet weak var animeCharacter: UILabel!
    @IBOutlet weak var newQuoteText: UITextView!
    @IBOutlet weak var changeAnime: UIPickerView!

    
    var byAnime = ByAnimeManager()
    

    var typedAnime: String?
    var quoteManager = ByAnimeManager()
    let quoteByAnimeTitle = "https://animechan.vercel.app/api/quotes/anime?title=naruto"
    
    
    
    
    
    
    override func viewDidLoad()
    {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        byAnime.delegate = self
        changeAnime.dataSource = self
        changeAnime.delegate = self

    }
    
    
    



    
    
    
    
    
    
    @IBAction func changeQuoteButton(_ sender: UIButton)
    {
        byAnime.performRequest(chosenMethod: quoteByAnimeTitle)
    }
    
    
    
    
    
    
    
    func didUpdateQuoteAndAnime(quoteGoesHere: String, characterGoesHere: String, animeGoesHere: String)
    {
        DispatchQueue.main.async {
            self.newQuoteText.text = quoteGoesHere
            self.animeTitle.text = "Anime: \(animeGoesHere)"
            self.animeCharacter.text = "Character: \(characterGoesHere)"
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ByAnimeQuoteScreenController: UIPickerViewDelegate
{
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//    }
}


extension ByAnimeQuoteScreenController: UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    
}
