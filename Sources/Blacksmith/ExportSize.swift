//
//  ExportSize.swift
//  Blacksmith
//
//  Created by Florian Schweizer on 03.01.22.
//

import Foundation

enum ExportSize {
    case iPhone
    case mac
    
    var size: CGSize {
        switch self {
            case .iPhone:
                return CGSize(width: 1242, height: 2688)
            case .mac:
                return CGSize(width: 1280, height: 800)
        }
    }
    
    var cornerRadius: Double {
        switch self {
            case .iPhone:
                return 40
            case .mac:
                return 8
        }
    }
}
