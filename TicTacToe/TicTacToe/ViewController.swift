//
//  ViewController.swift
//  TicTacToe
//
//  Created by Esraa Shata on 8/20/18.
//  Copyright © 2018 Esraa Shata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //buttons
    
    @IBOutlet weak var bu1: UIButton!
    @IBOutlet weak var bu2: UIButton!
    @IBOutlet weak var bu3: UIButton!
    @IBOutlet weak var bu4: UIButton!
    @IBOutlet weak var bu5: UIButton!
    @IBOutlet weak var bu6: UIButton!
    @IBOutlet weak var bu7: UIButton!
    @IBOutlet weak var bu8: UIButton!
    @IBOutlet weak var bu9: UIButton!
    
    
//when clicking
    @IBAction func buttClick(_ sender: Any) {
        
       let buSelect = sender as! UIButton
       playGame(buSelect: buSelect)
    }
    
    var activePlayer = 1
    var player1 = [Int]()
    var player2 = [Int]()
//playing//////
    func playGame(buSelect:UIButton)  {
    if activePlayer == 1
    {
     buSelect.setTitle("X", for: UIControlState.normal)
        buSelect.backgroundColor = UIColor(displayP3Red: 252/255, green: 177/255, blue: 191/255, alpha:0.8)
        player1.append(buSelect.tag)
        activePlayer = 2
        
       AutoPlay()
        }
        
    else
    {
        buSelect.setTitle("O", for: UIControlState.normal)
        buSelect.backgroundColor = UIColor(displayP3Red: 252/255, green: 240/255, blue: 198/255, alpha: 1)
        player2.append(buSelect.tag)
        activePlayer = 1
        
        }
        buSelect.isEnabled = false
        winner()
    }
  ///WINER///
    func winner()  {
      var winner = -1
    //row1
        if (player1.contains(1)&&player1.contains(2)&&player1.contains(3)){   winner = 1}
         if (player2.contains(1)&&player2.contains(2)&&player2.contains(3)){   winner = 2}
     //row2
        if (player1.contains(4)&&player1.contains(5)&&player1.contains(6)){   winner = 1}
        if (player2.contains(4)&&player2.contains(5)&&player2.contains(6)){   winner = 2}
    //row3
        if (player1.contains(7)&&player1.contains(8)&&player1.contains(9)){   winner = 1}
        if (player2.contains(7)&&player2.contains(8)&&player2.contains(9)){   winner = 2}
    //col1
        if (player1.contains(1)&&player1.contains(4)&&player1.contains(7)){   winner = 1}
        if (player2.contains(1)&&player2.contains(4)&&player2.contains(7)){   winner = 2}
    //col2
        if (player1.contains(2)&&player1.contains(5)&&player1.contains(8)){   winner = 1}
        if (player2.contains(2)&&player2.contains(5)&&player2.contains(8)){   winner = 2}
    //col3
        if (player1.contains(3)&&player1.contains(6)&&player1.contains(9)){   winner = 1}
        if (player2.contains(3)&&player2.contains(6)&&player2.contains(9)){   winner = 2}
    //side1
        if (player1.contains(1)&&player1.contains(5)&&player1.contains(9)){   winner = 1}
        if (player2.contains(1)&&player2.contains(5)&&player2.contains(9)){   winner = 2}
    //side2
        if (player1.contains(3)&&player1.contains(5)&&player1.contains(7)){   winner = 1}
        if (player2.contains(3)&&player2.contains(5)&&player2.contains(7)){   winner = 2}
    //alert msg
        if winner != -1{
            var msg = ""
            if winner == 1{
                msg = "Player 1 WINS 🎉"
            }
            else{
                 msg = "Player 2 WINS 🎉"
            }
         let alert = UIAlertController(title: "Game Over ", message:msg , preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style:UIAlertActionStyle.default, handler:nil))
          self.present(alert, animated: true, completion: nil)
        }

    }
    
    func AutoPlay(){
        //scan empty
        var emptyCells = [Int]()
        for index in 1...9 {
            if !(player1.contains(index) || player2.contains(index)){
                emptyCells.append(index)
            }
        }
           //choose randomly
        let randIndex = arc4random_uniform(UInt32(emptyCells.count))
        let cellID = emptyCells[Int(randIndex)]
        var buSelect:UIButton?
        switch cellID{
        case 1:
            buSelect = bu1
        case 2:
            buSelect = bu2
        case 3:
            buSelect = bu3
        case 4:
            buSelect = bu4
        case 5:
            buSelect = bu5
        case 6:
            buSelect = bu6
        case 7:
            buSelect = bu7
        case 8:
            buSelect = bu8
        case 9:
            buSelect = bu9
        default:
            buSelect = bu1
        }
        playGame(buSelect: buSelect!)
        
    }
    
}

