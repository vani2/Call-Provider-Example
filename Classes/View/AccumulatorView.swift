//
//  AccumulatorView.swift
//  Call Provider
//
//  Created by Ivan Vavilov on 7/13/16.
//  Copyright © 2016 Ivan Vavilov. All rights reserved.
//

import Foundation
import UIKit

class AccumulatorView: UIView {

    @IBOutlet weak var topLabelSpace: NSLayoutConstraint!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    private weak var spinner: SpinnerView?
    
    var viewModel: AccumulatorViewModel!
    {
        didSet
        {
            valueLabel.text = viewModel.value
            unitLabel.text = viewModel.unit
            spinner?.endValue = viewModel.progress
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        setupSubviews()
    }
    
    private func setupSubviews()
    {
        spinner = Bundle.main.loadNibNamed("SpinnerView",
                                           owner: nil,
                                           options: nil).first as! SpinnerView
        addSubview(spinner!)
        
        spinner!.snp_makeConstraints { (make) in
            make.leading.trailing.top.equalTo(0)
            make.height.equalTo(spinner!.snp_width)
        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        topLabelSpace.constant = bounds.width / 2 - valueLabel.font.lineHeight / 2
    }

}
