//
//  AccumulatorViewModel.swift
//  Call Provider
//
//  Created by Ivan Vavilov on 7/13/16.
//  Copyright © 2016 Ivan Vavilov. All rights reserved.
//

import UIKit

class AccumulatorViewModel {

    private(set) var value: String
    private(set) var unit: String
    private(set) var progress: CGFloat
    
    init(value: String, unit: String, progress: CGFloat)
    {
        self.value = value
        self.unit = unit
        self.progress = progress
    }
    
}
