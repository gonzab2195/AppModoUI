//
//  KeyPad.swift
//  AppModo
//
//  Created by Gonzalo Berro on 10/01/2024.
//

import SwiftUI

struct Keypad: Identifiable {
    let id = UUID()
    let mainText: String
    let subText: String
    let imageName: KeypadImages
}

enum KeypadImages : String {
    case Empty = ""
    case DeleteArrow = "delete-arrow"
    case FaceId = "face-id"
}

let singleKeypad = Keypad(mainText: "1", subText: "", imageName: .Empty)

let keypadArray: [Keypad] = [Keypad(mainText: "1", subText: "", imageName: .Empty),
                               Keypad(mainText: "2", subText: "ABC", imageName: .Empty),
                               Keypad(mainText: "3", subText: "DEF", imageName: .Empty),
                               Keypad(mainText: "4", subText: "GHI", imageName: .Empty),
                               Keypad(mainText: "5", subText: "JKL", imageName: .Empty),
                               Keypad(mainText: "6", subText: "MNO", imageName: .Empty),
                               Keypad(mainText: "7", subText: "PQRS", imageName: .Empty),
                               Keypad(mainText: "8", subText: "TUV", imageName: .Empty),
                               Keypad(mainText: "9", subText: "WXYZ", imageName: .Empty),
                               Keypad(mainText: "", subText: "", imageName: .FaceId),
                               Keypad(mainText: "0", subText: "", imageName: .Empty),
                               Keypad(mainText: "", subText: "", imageName: .DeleteArrow),]
