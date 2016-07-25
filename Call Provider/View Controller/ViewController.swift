//
//  ViewController.swift
//  Call Provider
//
//  Created by Ivan Vavilov on 7/13/16.
//  Copyright © 2016 Ivan Vavilov. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var container: UIStackView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupSpinners()
    }


    private func setupSpinners() {
        
        let width = 62//(view.bounds.width - 16 * 4) / 3
        
        container.snp_makeConstraints { (make) in
            make.height.equalTo(width + 25)
        }
        
        for i in 0..<3 {
            let spinner = Bundle.main.loadNibNamed("AccumulatorView",
                                                   owner: nil,
                                                   options: nil).first as! AccumulatorView
            
            spinner.snp_makeConstraints(closure: { (make) in
                make.width.equalTo(width)
                make.height.equalTo(width + 25)
            })
            
            container.addArrangedSubview(spinner)
        }
        
        container.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        container.isHidden = false
        
        let internet = AccumulatorViewModel(value: "1Гб", unit: "интернет", progress: 0.3)
        let minutes = AccumulatorViewModel(value: "275", unit: "минут", progress: 0.8)
        let messages = AccumulatorViewModel(value: "300", unit: "сообщений", progress: 1)
        
        let viewModels = [internet, minutes, messages]
        
        var i = 0
        
        container.arrangedSubviews.forEach { (accumulator) in
            (accumulator as! AccumulatorView).viewModel = viewModels[i]
            i += 1
        }
    }
}

