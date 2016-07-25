//
//  ViewFactory.swift
//  Call Provider
//
//  Created by Ivan Vavilov on 7/19/16.
//  Copyright © 2016 Ivan Vavilov. All rights reserved.
//

import Foundation
import UIKit

class ViewFactory {
    
    class func fillStackView(_ stackView: UIStackView, withRests rests: [AccumulatorViewModel]) {
        
        let width = 62//(view.bounds.width - 16 * 4) / 3
        
        stackView.snp_makeConstraints { (make) in
            _ = make.height.equalTo(width + 25)
        }
        
        for _ in 0..<3 {
            let spinner = Bundle.main.loadNibNamed("AccumulatorView",
                                                   owner: nil,
                                                   options: nil)?.first as! AccumulatorView
            
            spinner.snp_makeConstraints(closure: { (make) in
                _ = make.width.equalTo(width)
                _ = make.height.equalTo(width + 25)
            })
            
            stackView.addArrangedSubview(spinner)
        }
        
        var i = 0
        
        stackView.arrangedSubviews.forEach { (accumulator) in
            (accumulator as! AccumulatorView).viewModel = rests[i]
            i += 1
        }
    }
    
}
