//
// Created by Eldis on 2019-06-26.
// Copyright (c) 2019 NSExceptional. All rights reserved.
//

import UIKit

/// PKHUDSmallerSquareBaseView provides a small square view, which you can subclass and add additional views to.
open class PKHUDSmallerSquareBaseView: UIView {

    static let defaultSquareBaseViewFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: 60.0, height: 60.0))

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public init() {
        super.init(frame: PKHUDSmallerSquareBaseView.defaultSquareBaseViewFrame)
    }
    
}
