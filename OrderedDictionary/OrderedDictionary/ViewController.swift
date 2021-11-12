//
//  ViewController.swift
//  OrderedDictionary
//
//  Created by Viachaslau Kastsechka on 11/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var dic = OrderedDictionary<String, Any>()
        dic["1st key"] = "This is 1st key-value"
        dic["123"] = 312
        dic["last"] = "The end"
        
        print(dic)
        print(dic["123"] ?? "no value by given key")
        print(dic[1] ?? "no value by given index")
    }


}

