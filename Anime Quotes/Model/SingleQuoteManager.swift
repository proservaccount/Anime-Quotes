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

struct SingleQuoteManager
{
    
    var delegate: QuoteManagerDelegate?

    
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
                    

                    print("Error starting task!!!!")
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


    
    
    func parseJSON(_ animeData: Data) -> SingleQuoteModel?
    {
        let decoder = JSONDecoder()
        
        do
        {
            let decodedData = try decoder.decode(SingleQuoteData.self, from: animeData)
            
            let singleQuote = decodedData.quote
            let character = decodedData.character
            let anime = decodedData.anime
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
