//
//  ViewController.swift
//  Lesson_16-Part_2
//
//  Created by Evgeniy Nosko on 8.09.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!

//    cохранение через - FileManager (САМЫЙ РЕДКО используемый)
    override func viewDidLoad() {
        super.viewDidLoad()
//        чтение файла
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("profileFolder"),
              let data = try? Data(contentsOf: path) else {
            return
        }
        let text = String(data: data, encoding: .utf8)
        textField.text = text
        
    }

    @IBAction func buttonPressed() {
        
//        создание файла
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("profileFolder")else {
            return
        }
        
        let text = textField.text
        let data = text?.data(using: .utf8)
        try? data?.write(to: path)
        
    }

}

