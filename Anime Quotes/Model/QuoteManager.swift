//
//  QuoteManager.swift
//  Anime Quotes
//
//  Created by Tomas Sanni on 11/18/21.
//

import Foundation


protocol QuoteManagerDelegate
{
    func didUpdateQuote(quoteGoesHere: String, characterGoesHere: String, animeGoesHere: String)
}

struct QuoteManager
{
    
    var delegate: QuoteManagerDelegate?
    
    
    
    
    func performRequest()
    {
        let animeQuoteURL = "https://animechan.vercel.app/api/random"
        
        
        //1. Create a URL
        if let url = URL(string: animeQuoteURL)
        {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            
            //3. Give the session a task
            let task =  session.dataTask(with: url) { data, response, error in
                if error != nil
                {
                    print("Error!!!!")
                    return
                }
                
                if let safeData = data
                {
                    if let anime = self.parseJSON(safeData)
                    {
                        
                        delegate?.didUpdateQuote(quoteGoesHere: anime.quote, characterGoesHere: anime.character, animeGoesHere: anime.anime)

                    }
                    
                }
                
            }
            //4. Start the task
            task.resume()
            
        }
    }


    
    
    func parseJSON(_ animeData: Data) -> QuoteModel?
    {
        let decoder = JSONDecoder()
        
        do
        {
            let decodedData = try decoder.decode(QuoteData.self, from: animeData)
            
            let singleQuote = decodedData.quote
            let character = decodedData.character
            let anime = decodedData.anime
            let allTheData = QuoteModel(quote: singleQuote, character: character, anime: anime)
            
            print(allTheData)
            
            
            return allTheData
        }
        catch
        {
            print("Big Error")
            return nil
        }
    }
    
}
