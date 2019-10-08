//
//  ViewController.swift
//  MoarButtons
//
//  Created by Lunga MAKWAKWA on 2019/10/08.
//  Copyright © 2019 Lunga MAKWAKWA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numScr:Double = 0;
    var PrevnumScr:Double = 0;
    var math = false;
    var opptag = 0;
    var ans:Double = 0
    var prevOpptag = 0

    @IBOutlet weak var pressnum: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calnum(_ sender: UIButton) {
        
        if (math == true)
        {
            pressnum.text = String(sender.tag)
            numScr = Double(pressnum.text!)!
            math = false
        }
        else
        {
            pressnum.text = pressnum.text! + String(sender.tag)
            numScr = Double(pressnum.text!)!
        }
        
    }
    
    @IBAction func actbtn(_ sender: UIButton) {
        
        if (pressnum.text != "" && sender.tag != 10 && sender.tag != 17)
        {
                ans = PrevnumScr
                PrevnumScr = Double(pressnum.text!)!

                if (sender.tag == 11) //neg
                {
                    
                }
                else if (sender.tag == 12) // percentage
                {
                    
                }
                else if (sender.tag == 13 && ans != 0) // divide
                {
                    if (prevOpptag != 13 && prevOpptag != 0)
                    {
                        if (prevOpptag == 14)
                        {
                            PrevnumScr = ans + PrevnumScr
                        }
                    }
                    pressnum.text = "/"
                    pressnum.text = String(ans / PrevnumScr)
                    PrevnumScr = Double(pressnum.text!)!
                    prevOpptag = 13
                }
                else if (sender.tag == 14 && ans != 0) // multiply
                {
                    if (prevOpptag != 14 && prevOpptag != 0)
                    {
                        ans = PrevnumScr
                    }
                    pressnum.text = "x"
                    pressnum.text = String(ans * PrevnumScr)
                    PrevnumScr = Double(pressnum.text!)!
                    prevOpptag = 14
                }
                else if (sender.tag == 15 && ans != 0) // subtract
                {
                    if (prevOpptag != 15 && prevOpptag != 0)
                    {
                        if (prevOpptag == 14)
                        {
                            PrevnumScr = ans + PrevnumScr
                        }
                        else if (prevOpptag == 15)
                        {
                            PrevnumScr = ans + PrevnumScr
                        }
                        else if (prevOpptag == 16)
                        {
                            PrevnumScr = ans + PrevnumScr
                        }
                    }
                    pressnum.text = "-"
                    pressnum.text = String(ans - PrevnumScr)
                    PrevnumScr = Double(pressnum.text!)!
                    prevOpptag = 15
                    
                }
                else if (sender.tag == 16) // add
                {
                    
                    if (prevOpptag != 16 && prevOpptag != 16)
                    {
                        
                        if (prevOpptag == 13)
                        {
                            PrevnumScr = ans + PrevnumScr
                        }
                        else if (prevOpptag == 14)
                        {
                            PrevnumScr = ans + PrevnumScr
                        }
                        else if (prevOpptag == 15)
                        {
                            PrevnumScr = ans - PrevnumScr
                        }
                    }
                    pressnum.text = "+"
                    pressnum.text = String(ans + PrevnumScr)
                    PrevnumScr = Double(pressnum.text!)!
                    prevOpptag = 16
                    
                }
                opptag = sender.tag
                math = true
        }
            
        else if (sender.tag == 17) //equals to
        {
            if (opptag == 13) //divider
            {
                if (numScr == 0)
                {
                    let alert = UIAlertController (title: "Error", message: "You cannot Divide by zero", preferredStyle: .alert)
                    let cancelAct = UIAlertAction (title: "Cancel", style: .cancel, handler: nil)
                    
                    alert.addAction(cancelAct)
                    present(alert, animated: true)
                }
                else
                {
                        pressnum.text = String(PrevnumScr / numScr)
                }
                
            }
            else if (opptag == 14) // multiply
            {
                pressnum.text = String(PrevnumScr * numScr)
            }
            else if (opptag == 15) // subtract
            {
                pressnum.text = String(PrevnumScr - numScr)
            }
            else if (opptag == 16) // add
            {
                pressnum.text = String(PrevnumScr + numScr)
            }
            PrevnumScr = numScr;
        }
        else if (sender.tag == 10)
        {
            pressnum.text = ""
            PrevnumScr = 0
            numScr = 0
            opptag = 0
        }
        
        
    }
}

