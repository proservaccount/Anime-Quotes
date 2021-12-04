//
//  ByAnimeManager.swift
//  Anime Quotes
//
//  Created by Tomas Sanni on 12/2/21.
//

import Foundation


protocol ByAnimeQuoteManagerDelegate
{
    func didUpdateQuoteAndAnime(quoteGoesHere: String, characterGoesHere: String, animeGoesHere: String)
    
    func updatePickerView(numOfSlots: Int)
}


struct ByAnimeManager
{
    var delegate: ByAnimeQuoteManagerDelegate?
    
    func performRequest(chosenMethod: String)
    {
        
        
        
        //1. Create a URL
        if let url = URL(string: chosenMethod)
        {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            
            //3. Give the session a task
            let task =  session.dataTask(with: url) { data, response, error in
                if error != nil
                {
                    
                    
                    print("Error starting task!!!! \(error)")
                    return
                }
                
                if let safeData = data
                {
                    if let anime = self.parseJSON(safeData)
                    {
                        delegate?.didUpdateQuoteAndAnime(quoteGoesHere: anime.quote, characterGoesHere: anime.character, animeGoesHere: anime.anime)
                    }
                }
                
            }
            //4. Start the task
            task.resume()
            
        }
    }
    
    
    
    
    
    
    func parseJSON(_ animeData: Data) -> SingleQuoteModel?
    {
        let decoder = JSONDecoder()
        do
        {
            let decodedData = try decoder.decode([SingleQuoteData].self, from: animeData)
            
            print("HAHAHAHAHA The SIZE: \(decodedData.count)")
            delegate?.updatePickerView(numOfSlots: decodedData.count)
            let randomArrayValue = Int.random(in: 0..<decodedData.count)

            let singleQuote = decodedData[randomArrayValue].quote
            let character = decodedData[randomArrayValue].character
            let anime = decodedData[randomArrayValue].anime
            let allTheData = SingleQuoteModel(quote: singleQuote, character: character, anime: anime)
            
            print(allTheData)
            
            
            return allTheData
        }
        catch
        {
            print("Error getting data \(error)")
            return nil
        }
    }
}




