//
//  ExportSize.swift
//  Blacksmith
//
//  Created by Florian Schweizer on 03.01.22.
//

import SwiftUI

public enum ExportSize {
    case iPhone
    case mac
    case custom(CGSize, Double)
    
    public var size: CGSize {
        switch self {
            case .iPhone:
                return CGSize(width: 1242, height: 2688)
            case .mac:
                return CGSize(width: 1280, height: 800)
            case .custom(let size, _):
                return size
        }
    }
    
    public var cornerRadius: Double {
        switch self {
            case .iPhone:
                return 40
            case .mac:
                return 8
            case .custom(_, let radius):
                return radius
        }
    }
}
