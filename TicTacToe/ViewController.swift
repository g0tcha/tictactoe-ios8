//
//  ViewController.swift
//  TicTacToe
//
//  Created by Vincent GROSSIER on 29/07/2015.
//  Copyright (c) 2015 Kodappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    enum Player {
        case One
        case Two
    }
    
    var played = 0
    var currentPlayer = Player.One
    var cells = ["One": false, "Two": false, "Three": false, "Four": false, "Five": false, "Six": false, "Seven": false, "Eight": false, "Nine": false]
    
    var combinations: [[String: String]] = []
    
    let playerOneImage = UIImage(named: "X")
    let playerTwoImage = UIImage(named: "0")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCombinations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCombinations() {
        combinations.append(["One": "", "Two": "", "Three": ""])
        combinations.append(["One": "", "Four": "", "Seven": ""])
        combinations.append(["One": "", "Five": "", "Nine": ""])
        combinations.append(["Two": "", "Five": "", "Eight": ""])
        combinations.append(["Three": "", "Six": "", "Nine": ""])
        combinations.append(["Three": "", "Five": "", "Seven": ""])
        combinations.append(["Four": "", "Five": "", "Six": ""])
        combinations.append(["Three": "", "Five": "", "Seven": ""])
        combinations.append(["Seven": "", "Eight": "", "Nine": ""])
    }
    
    func checkGame() {
        if played == 9 {
            showLoseAlert()
            resetGame()
        }
    }
    
    func resetGame() {
        resetButtons()
        resetCombinations()
        cells.removeAll(keepCapacity: true)
        cells = ["One": false, "Two": false, "Three": false, "Four": false, "Five": false, "Six": false, "Seven": false, "Eight": false, "Nine": false]
        played = 0
    }
    
    func resetButtons() {
        oneButton.setBackgroundImage(UIImage(), forState: .Normal)
        twoButton.setBackgroundImage(UIImage(), forState: .Normal)
        threeButton.setBackgroundImage(UIImage(), forState: .Normal)
        fourButton.setBackgroundImage(UIImage(), forState: .Normal)
        fiveButton.setBackgroundImage(UIImage(), forState: .Normal)
        sixButton.setBackgroundImage(UIImage(), forState: .Normal)
        sevenButton.setBackgroundImage(UIImage(), forState: .Normal)
        eightButton.setBackgroundImage(UIImage(), forState: .Normal)
        nineButton.setBackgroundImage(UIImage(), forState: .Normal)
    }
    
    func resetCombinations() {
        combinations.removeAll(keepCapacity: true)
        loadCombinations()
    }
    
    func switchPlayer() {
        if currentPlayer == .One {
            currentPlayer = .Two
        } else {
            currentPlayer = .One
        }
    }
    
    func updateCombinationWith(value: String, forCell cell: String) {
        switchPlayer()
        played++
        
        for (index, combi) in enumerate(combinations) {
            if combi[cell] != nil {
                combinations[index].updateValue(value, forKey: cell)
                if checkCombination(combinations[index]) {
                    showWinAlert()
                } else {
                    checkGame()
                }
            }
        }
    }
    
    func checkCombination(combi: [String: String]) -> Bool {
        var letter = combi.values.first!
        
        for value in combi.values {
            if (value != letter) || (value == "") {
                return false
            }
        }
        
        return true
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Win !", message: "You win this game!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
            UIAlertAction in
                self.resetGame()
        }
        
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showLoseAlert() {
        let alert = UIAlertController(title: "Lose !", message: "You lose this game!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
            UIAlertAction in
                self.resetGame()
        }
        
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func oneTapped(sender: AnyObject) {
        if(cells["One"]! == false) {
            let button = sender as! UIButton
            
            if currentPlayer == Player.One {
                button.setBackgroundImage(playerOneImage, forState: UIControlState.Normal)
                updateCombinationWith("X", forCell: "One")
            } else {
                button.setBackgroundImage(playerTwoImage, forState: UIControlState.Normal)
                updateCombinationWith("0", forCell: "One")
            }
            
            cells["One"] = true
        }
    }
    @IBAction func twoTapped(sender: AnyObject) {
        if(cells["Two"]! == false) {
            let button = sender as! UIButton
            
            if currentPlayer == Player.One {
                button.setBackgroundImage(playerOneImage, forState: UIControlState.Normal)
                updateCombinationWith("X", forCell: "Two")
            } else {
                button.setBackgroundImage(playerTwoImage, forState: UIControlState.Normal)
                updateCombinationWith("0", forCell: "Two")
            }
            
            cells["Two"] = true
        }
    }
    
    @IBAction func threeTapped(sender: AnyObject) {
        if(cells["Three"]! == false) {
            let button = sender as! UIButton
            
            if currentPlayer == Player.One {
                button.setBackgroundImage(playerOneImage, forState: UIControlState.Normal)
                updateCombinationWith("X", forCell: "Three")
            } else {
                button.setBackgroundImage(playerTwoImage, forState: UIControlState.Normal)
                updateCombinationWith("0", forCell: "Three")
            }
            
            cells["Three"] = true
        }
    }
    
    @IBAction func fourTapped(sender: AnyObject) {
        if(cells["Four"]! == false) {
            let button = sender as! UIButton
            
            if currentPlayer == Player.One {
                button.setBackgroundImage(playerOneImage, forState: UIControlState.Normal)
                updateCombinationWith("X", forCell: "Four")
            } else {
                button.setBackgroundImage(playerTwoImage, forState: UIControlState.Normal)
                updateCombinationWith("0", forCell: "Four")
            }
            
            cells["TwoOne"] = true
        }
    }
    
    
    @IBAction func fiveTapped(sender: AnyObject) {
        if(cells["Five"]! == false) {
            let button = sender as! UIButton
            
            if currentPlayer == Player.One {
                button.setBackgroundImage(playerOneImage, forState: UIControlState.Normal)
                updateCombinationWith("X", forCell: "Five")
            } else {
                button.setBackgroundImage(playerTwoImage, forState: UIControlState.Normal)
                updateCombinationWith("0", forCell: "Five")
            }
            
            cells["TwoTwo"] = true
            
        }
    }
    
    
    @IBAction func sixTapped(sender: AnyObject) {
        if(cells["Six"]! == false) {
            let button = sender as! UIButton
            
            if currentPlayer == Player.One {
                button.setBackgroundImage(playerOneImage, forState: UIControlState.Normal)
                updateCombinationWith("X", forCell: "Six")
            } else {
                button.setBackgroundImage(playerTwoImage, forState: UIControlState.Normal)
                updateCombinationWith("0", forCell: "Six")
            }
            
            cells["Six"] = true
            
        }
    }
    
    @IBAction func sevenTapped(sender: AnyObject) {
        if(cells["Seven"]! == false) {
            let button = sender as! UIButton
            
            if currentPlayer == Player.One {
                button.setBackgroundImage(playerOneImage, forState: UIControlState.Normal)
                updateCombinationWith("X", forCell: "Seven")
            } else {
                button.setBackgroundImage(playerTwoImage, forState: UIControlState.Normal)
                updateCombinationWith("0", forCell: "Seven")
            }
            
            cells["ThreeOne"] = true
        }
    }
    
    
    @IBAction func eightTapped(sender: AnyObject) {
        if(cells["Eight"]! == false) {
            let button = sender as! UIButton
            
            if currentPlayer == Player.One {
                button.setBackgroundImage(playerOneImage, forState: UIControlState.Normal)
                updateCombinationWith("X", forCell: "Eight")
            } else {
                button.setBackgroundImage(playerTwoImage, forState: UIControlState.Normal)
                updateCombinationWith("0", forCell: "Eight")
            }
            
            cells["Eight"] = true
            
        }
    }
    
    
    @IBAction func nineTapped(sender: AnyObject) {
        if(cells["Nine"]! == false) {
            let button = sender as! UIButton
            
            if currentPlayer == Player.One {
                button.setBackgroundImage(playerOneImage, forState: UIControlState.Normal)
                updateCombinationWith("X", forCell: "Nine")
            } else {
                button.setBackgroundImage(playerTwoImage, forState: UIControlState.Normal)
                updateCombinationWith("0", forCell: "Nine")
            }
            
            cells["Nine"] = true
        }
    }

}

