//
//  ByAnimeQuoteScreenController.swift
//  Anime Quotes
//
//  Created by Tomas Sanni on 12/1/21.
//

import UIKit

class ByAnimeQuoteScreenController: UIViewController, ByAnimeQuoteManagerDelegate
{
    
    
    var only10 = AllAnimeManager()
    
    
    func updatePickerView(numOfSlots: Int)
    {
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

    var stringOfAnimeFromPickerView = "Hyouka"
    var quoteByAnimeTitle = "https://animechan.vercel.app/api/quotes/anime?title="

    
    override func viewDidLoad()
    {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.green.cgColor, UIColor.black.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        byAnime.delegate = self
        changeAnime.dataSource = self
        changeAnime.delegate = self
        byAnime.performRequest(chosenMethod: quoteByAnimeTitle+stringOfAnimeFromPickerView)


    }
    
    
    



    
    
    
    
    
    
    @IBAction func changeQuoteButton(_ sender: UIButton)
    {
        
        
        var newString = stringOfAnimeFromPickerView.replacingOccurrences(of: " ", with: "%20")
        var newerString = newString.replacingOccurrences(of: "√", with: "%E2%88%9A")
        print(newString)
        

        
        byAnime.performRequest(chosenMethod: quoteByAnimeTitle+newerString)
        print(quoteByAnimeTitle + newerString)
    }
    
    
    
    
    
    
    
    func didUpdateQuoteAndAnime(quoteGoesHere: String, characterGoesHere: String, animeGoesHere: String)
    {
        DispatchQueue.main.async {
            self.newQuoteText.text = quoteGoesHere
            self.animeTitle.text = "Anime: \(animeGoesHere)"
            self.animeCharacter.text = "Character: \(characterGoesHere)"
        }
    }

    



}


extension ByAnimeQuoteScreenController: UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        let displayFirstTen = only10.allAnimeFromSite[row]
        return displayFirstTen


    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        stringOfAnimeFromPickerView = only10.allAnimeFromSite[row]
    }
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



extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
