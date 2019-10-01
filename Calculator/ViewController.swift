//
//  ViewController.swift
//  Calculator
//
//  Created by Michael Schwartz on 9/30/19.
//  Copyright © 2019 Michael Schwartz. All rights reserved.
//

import UIKit

//func insert(_ newElement: Character, at i: String.Index);

class ViewController: UIViewController
{
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var operationFlag = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func number(_ sender: UIButton)
    {
        if(operationFlag == true)
        {
            label.text = String(sender.tag - 1);
            numberOnScreen = Double(label.text!)!
            operationFlag = false;
        }
        
        else if(sender.tag != 11)
        {
            label.text = label.text! + String(sender.tag - 1);
            numberOnScreen = Double(label.text!)!
        }
            
        else if(sender.tag == 11)
        {
            label.text = label.text! + String(".");
            numberOnScreen = Double(label.text!)!
        }
        
//        else if(sender.tag == 17)
//        {
//            label.text = label.text! + String("-");
//            numberOnScreen = Double(label.text!)!
//        }
    }
    
    @IBAction func operation(_ sender: UIButton)
    {
        if(label.text != "" && sender.tag != 16 && sender.tag != 19)
        {
            previousNumber = Double(label.text!)!;
            
            if(sender.tag == 12) // Addition
            {
                label.text = "+";
            }
            else if(sender.tag == 13) // Subtraction
            {
                label.text = "-";
            }
            else if(sender.tag == 14) // Multiplication
            {
                label.text = "x";
            }
            else if(sender.tag == 15) // Division
            {
                label.text = "÷";
            }
            operation = sender.tag;
            operationFlag = true;
        }
            
        else if(sender.tag == 19) // Equals
        {
            if(operation == 12)
            {
                label.text = String(previousNumber + numberOnScreen);
            }
            else if(operation == 13)
            {
                label.text = String(previousNumber - numberOnScreen);
            }
            else if(operation == 14)
            {
                label.text = String(previousNumber * numberOnScreen);
            }
            else if(operation == 15)
            {
                label.text = String(previousNumber / numberOnScreen);
            }
        }
        
        else if(sender.tag == 16)
        {
            label.text = "";
            numberOnScreen = 0;
            previousNumber = 0;
            operation = 0;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

