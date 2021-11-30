//
//  Beginning.swift
//  Anime Quotes
//
//  Created by Tomas Sanni on 11/29/21.
//

import UIKit

class Beginning: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        print("Button Pressed")
        performSegue(withIdentifier: "theButton", sender: self)
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
