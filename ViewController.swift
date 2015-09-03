//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Samuel Cordova on 8/24/15.
//  Copyright © 2015 Samuel Cordova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 is noughts, 2 is crosses
    
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6,], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameActive = true
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        activePlayer = 1
        
        gameActive = true
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button : UIButton
        
        for var i = 0; i < 9; i++
        {
            button = view.viewWithTag(i) as! UIButton
            
            button.setImage(nil, forState: .Normal)
        }
        
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)

        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true
        {
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1
            {
                image = UIImage(named: "nought.png")!
                
                activePlayer = 2
                
            }
            else
            {
                image = UIImage(named: "cross.png")!
                
                activePlayer = 1
                
            }
            
            sender.setImage(image, forState: .Normal)
            
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                var labelText = "Noughts has won!"
                
                if gameState[combination[0]] == 2
                {
                    labelText = "Crosses has won!"
                }
                
                gameOverLabel.text = labelText
                
                gameOverLabel.hidden = false
                playAgainButton.hidden = false
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    
                    self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                    
                    self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
                })
                
                gameActive = false
                break
            }

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {

    }


}

