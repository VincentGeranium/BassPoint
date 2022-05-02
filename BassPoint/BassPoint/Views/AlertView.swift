//
//  AlertView.swift
//  BassPoint
//
//  Created by Kwangjun Kim on 2022/05/01.
//

import Foundation
import UIKit

class AlertView: UIAlertController {
    
    var titles: String?
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.titles = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
