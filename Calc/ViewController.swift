//
//  ViewController.swift
//  Calc
//
//  Created by Maiqui Cedeño on 3/15/16.
//  Copyright © 2016 maikytech. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    
    
    @IBOutlet var Screen: UILabel!
    
    //Declaracion de variables.
    var result:Float = 0
    var currentNumber:Float = 0
    var currentOperation: String = "="

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Screen.text = "\(result)"       //Condiciones iniciales de la pantalla
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numbers(sender: UIButton)
    {
        //Cada numero que ingresemos aumentara en la escala decimal y se guardara en currentNumber.
        
        //"sender.titleLabel.text" nos devuelve el string que contiene el sender, en este caso, el numero de la tecla pulsada.
        //"Int(sender.titleLabel!.text!)!" transforma el valor del sender en entero,el signo "!" nos asegura que el sender contiene un string transformable a entero.
        //"Float(Int(sender.titleLabel!.text!)!)" Transforma el entero a Float.
        
        currentNumber = currentNumber * 10 + Float(Int(sender.titleLabel!.text!)!)
        
        Screen.text = "\(currentNumber)"           //Se imprime en la pantalla
        
    }
    
    @IBAction func clear(sender: UIButton)
    {
        //Se resetean todas las variables.
        
        result = 0
        currentNumber = 0
        currentOperation = "="
        Screen.text = "\(result)"
        
    }
    
    @IBAction func operations(sender: UIButton)
    {
        switch currentOperation     //Seleccion de operacion
        {
            case "/":
                result = result / currentNumber
            
            case "*":
                result = result * currentNumber
            
            case "-":
                result = result - currentNumber
            
            case "+":
                result = result + currentNumber
            
            case "=":
                result = currentNumber
            
            default:
                print("Error")
        }
        
        currentNumber = 0   //Reset del valor actual.
        Screen.text = "\(result)"
        
        //Reset de result si solicitamos el resultado.
        if(sender.titleLabel!.text == "=")
        {
            result = 0
        }
        
        //Asignamos el valor del sender a la variable "currentOperation"
        currentOperation = sender.titleLabel!.text! as String
    }
}

