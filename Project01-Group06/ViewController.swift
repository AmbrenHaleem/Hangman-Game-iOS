//
//  ViewController.swift
//  Project01-Group06
//
//  Created by Ambreen Haleem on 2023-02-11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var neckLabel: UILabel!
    @IBOutlet weak var leftHandLabel: UILabel!
    @IBOutlet weak var rightHandLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var leftLegLabel: UILabel!
    @IBOutlet weak var rightLegLabel: UILabel!
    @IBOutlet weak var winCountLabel: UILabel!
    @IBOutlet weak var lossCountLabel: UILabel!
    
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var rightLegLbl: UILabel!
    @IBOutlet weak var guess1Button: UIButton!
    @IBOutlet weak var guess2Button: UIButton!
    @IBOutlet weak var guess3Button: UIButton!
    @IBOutlet weak var guess4Button: UIButton!
    @IBOutlet weak var guess5Button: UIButton!
    @IBOutlet weak var guess6Button: UIButton!
    @IBOutlet weak var guess7Button: UIButton!
    
    @IBOutlet weak var Q: UIButton!
    @IBOutlet weak var L: UIButton!
    @IBOutlet weak var J: UIButton!
    @IBOutlet weak var H: UIButton!
    @IBOutlet weak var G: UIButton!
    @IBOutlet weak var F: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var S: UIButton!
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var P: UIButton!
    @IBOutlet weak var O: UIButton!
    
    @IBOutlet weak var K: UIButton!
    @IBOutlet weak var I: UIButton!
    @IBOutlet weak var U: UIButton!
    @IBOutlet weak var Y: UIButton!
    @IBOutlet weak var T: UIButton!
    @IBOutlet weak var R: UIButton!
    @IBOutlet weak var E: UIButton!
    @IBOutlet weak var W: UIButton!
    
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var V: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var X: UIButton!
    @IBOutlet weak var Z: UIButton!
    
    @IBOutlet weak var M: UIButton!
    @IBOutlet weak var N: UIButton!
    
    private let wordsList = ["Ability","Absence","Academy","Account","Accused","Achieve","Acquire","Address","Advance","Adverse","Because","Bedroom","Believe","Beneath","Benefit","Besides","Between","Billion","Binding","Brother","Content","Contest","Context","Control","Convert","Correct","Council","Counsel","Counter","Country","Edition","Elderly","Element","Engaged","Enhance","Essence","Evening","Evident","Exactly","Examine","Gallery","Gateway","General","Genetic","Genuine","Gigabit","Greater","Hanging","Heading","Healthy"];
    
    private var selectedWord = "";
    private var selectedWordArray = [Character]()
    private var wrongGuessCount = 0;
    private var winCount = 0;
    private var lossCount = 0;
    private var wrongCount = 0;
    private var rightCount = 0;
    private var pressedLetter = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // select random word
        selectWord()
        winCountLabel.text = "WINS : \(winCount)"
        lossCountLabel.text = "LOSSES : \(lossCount)"
    }
    
    @IBAction func onAlphabetPress(_ sender: UIButton) {
        if let letter = sender.titleLabel?.text{
            print(letter)
            pressedLetter = letter.uppercased()
            sender.isEnabled = false
            fillGuessLine(sender)
        }
    }
    private func resetCounts()
    {
        wrongCount = 0;
        rightCount = 0;
        Q.isEnabled = true
        Q.backgroundColor = UIColor.systemGray6
        W.isEnabled = true
        W.backgroundColor = UIColor.systemGray6
        E.isEnabled = true
        E.backgroundColor = UIColor.systemGray6
        R.isEnabled = true
        R.backgroundColor = UIColor.systemGray6
        T.isEnabled = true
        T.backgroundColor = UIColor.systemGray6
        Y.isEnabled = true
        Y.backgroundColor = UIColor.systemGray6
        U.isEnabled = true
        U.backgroundColor = UIColor.systemGray6
        I.isEnabled = true
        I.backgroundColor = UIColor.systemGray6
        O.isEnabled = true
        O.backgroundColor = UIColor.systemGray6
        P.isEnabled = true
        P.backgroundColor = UIColor.systemGray6
        A.backgroundColor = UIColor.systemGray6
        A.isEnabled = true
        S.backgroundColor = UIColor.systemGray6
        S.isEnabled = true
        D.backgroundColor = UIColor.systemGray6
        D.isEnabled = true
        F.backgroundColor = UIColor.systemGray6
        F.isEnabled = true
        G.backgroundColor = UIColor.systemGray6
        G.isEnabled = true
        H.backgroundColor = UIColor.systemGray6
        H.isEnabled = true
        J.backgroundColor = UIColor.systemGray6
        J.isEnabled = true
        K.backgroundColor = UIColor.systemGray6
        K.isEnabled = true
        L.backgroundColor = UIColor.systemGray6
        L.isEnabled = true
        
        Z.backgroundColor = UIColor.systemGray6
        Z.isEnabled = true
        X.backgroundColor = UIColor.systemGray6
        X.isEnabled = true
        C.backgroundColor = UIColor.systemGray6
        C.isEnabled = true
        V.backgroundColor = UIColor.systemGray6
        V.isEnabled = true
        B.backgroundColor = UIColor.systemGray6
        B.isEnabled = true
        N.backgroundColor = UIColor.systemGray6
        N.isEnabled = true
        M.backgroundColor = UIColor.systemGray6
        M.isEnabled = true
    }
    private func fillGuessLine(_ sender: UIButton)
    {
        var wordFound = false
        for(index,value) in selectedWordArray.enumerated(){
//            print("My letter #  \(index+1)  : \(value.uppercased())")
            if(pressedLetter == String(selectedWordArray[index]).uppercased()){
                setGuessLetter(index, value)
                sender.backgroundColor = UIColor.green
                rightCount+=1
                wordFound = true
            }
        }
        if !wordFound
        {
            sender.backgroundColor = UIColor.red
            wrongCount+=1
          
            
        }
        if wrongCount==7{
            let gameOverAlert = UIAlertController(title: "Game Over", message: "Correct word was \(selectedWord). Would you like to play again?", preferredStyle: UIAlertController.Style.alert)
            
            self.lossCount+=1
            gameOverAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                self.selectWord()
                
                self.lossCountLabel.text = "LOSSES : \(self.lossCount)"
                self.resetCounts()
                }))

            gameOverAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                    self.lossCountLabel.text = "LOSSES : \(self.lossCount)"
                }))

                self.present(gameOverAlert, animated: true, completion: nil)
        }
        if rightCount == 7{
            let gameOverAlert = UIAlertController(title: "Phew!", message: "You saved me! Would you like to play again?", preferredStyle: UIAlertController.Style.alert)
            self.winCount+=1
            gameOverAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                self.selectWord()
                
                self.winCountLabel.text = "WINS : \(self.winCount)"
                self.resetCounts()
                }))

            gameOverAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                    self.winCountLabel.text = "WINS : \(self.winCount)"
                }))

                self.present(gameOverAlert, animated: true, completion: nil)
        }
    }
    
    private func selectWord(){
        let randomIndex = Int(arc4random_uniform(UInt32(wordsList.count)))
        selectedWord = wordsList[randomIndex]
        selectedWordArray = Array(selectedWord)
        print(selectedWord)
        
    }
    
    private func setGuessLetter(_ index:Int,_ value: Character)
    {
        switch index {
        case 0:
            guess1Button.setTitle(String(value).uppercased(), for: .normal)
            break
        case 1:
            guess2Button.setTitle(String(value).uppercased(), for: .normal)
            break
        case 2:
            guess3Button.setTitle(String(value).uppercased(), for: .normal)
            break
        case 3:
            guess4Button.setTitle(String(value).uppercased(), for: .normal)
            break
        case 4:
            guess5Button.setTitle(String(value).uppercased(), for: .normal)
            break
        case 5:
            guess6Button.setTitle(String(value).uppercased(), for: .normal)
            break
        case 6:
            guess7Button.setTitle(String(value).uppercased(), for: .normal)
            break
        default:
            break
        }
    }
}

