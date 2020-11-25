//
//  ViewController.swift
//  Restaurant
//
//  Created by wl on 2020/11/25.
//

import UIKit
import UniformTypeIdentifiers


extension UTType {
    //App新定义的类型
    public static let restaurantMenu = UTType(exportedAs: "com.hzjuzhi.restaurantmenu")
    
    //别人的App定义的类型
    public static var foodList: UTType {
        UTType(importedAs: "com.competitor.foodlist")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        printMenu()
    }
    
    func printMenu() {
        //1.获取文件
        let fileURL = Bundle.main.url(forResource: "food", withExtension: "restaurantmenu")!
        
        if let resourcesValues  = try? fileURL.resourceValues(forKeys: [.contentTypeKey]),
            // 2.获取文件类型
            let type = resourcesValues.contentType {
            print("type description: \(type.localizedDescription!)")
            
            // 3.解析文件, 因为我们的menu是基于json格式保存的,我们使用JSONDecoder解析
            if type.conforms(to: .restaurantMenu) {
                let memu = try! JSONDecoder().decode([String].self, from: Data(contentsOf: fileURL))
                print(memu)
            }
        }
    }

}




