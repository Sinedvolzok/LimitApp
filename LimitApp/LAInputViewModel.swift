//
//  LAInputViewModel.swift
//  LimitApp
//
//  Created by Denis Kozlov on 14.12.2023.
//

import Foundation

class LAInputViewModel {
    //MARK: Tableview DAataSourse Array
    let inputButtonCells:[LAInputButton] = [
        .number(7),.number(8),.number(9),.backspace,
        .number(4),.number(5),.number(6),.subtract,
        .number(1),.number(2),.number(3),.add,
        .number(0),.decimal,.enter
    ]
    
    private(set) lazy var inputHeader: String = "108"
}
