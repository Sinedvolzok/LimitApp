//
//  LAInputButton.swift
//  LimitApp
//
//  Created by Denis Kozlov on 14.12.2023.
//

import Foundation
import UIKit

enum LAInputButton {
    case add
    case subtract
    case number(Int)
    case decimal
    case backspace
    case enter
    
    init(inputButton:LAInputButton) {
        switch inputButton {
        case.add,.subtract,.decimal,.backspace,.enter:
            self = inputButton
        case .number(let int):
            if int.description.count == 1 {
                self = inputButton
            } else { fatalError("InputButton was not 1 digit during init")}
        }
    }
}

extension LAInputButton {
    var title: String {
        switch self {
        case .add:             return "+"
        case .subtract:        return "-"
        case .number(let int): return int.description
        case .decimal:         return "."
        case .backspace:       return "<"
        case .enter:           return "|"
        }
    }
    
    var color: UIColor {
        switch self {
        case.add,.subtract,.backspace:
            return .systemPink
        case .number(_),.decimal:
            return .systemGray3
        case .enter:
            return .systemOrange
        }
    }
}
