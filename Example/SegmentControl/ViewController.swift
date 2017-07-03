//
//  ViewController.swift
//  SegmentControl
//
//  Created by wangchengqvan@gmail.com on 07/03/2017.
//  Copyright (c) 2017 wangchengqvan@gmail.com. All rights reserved.
//

import UIKit
import SegmentControl

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let segmentControl = SegmentControl(frame: CGRect(origin: CGPoint(x: 0, y: 64), size: CGSize(width: UIScreen.main.bounds.width, height: 44)), titles: ["美团", "百度", "百度", "百度"]) { idx in
            print(idx, "🌹")
        }
        view.addSubview(segmentControl)
        view.backgroundColor = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

