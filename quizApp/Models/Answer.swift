//
//  Answer.swift
//  quizApp
//
//  Created by Евгений Дубиль on 02.04.2022.
//

struct Answer {
    let text: String
    let type: MemType
}

enum MemType: String {
    case shrek = "shrek"
    case sova = "sova"
    case cat = "cat"
    
    var definition: String {
        switch self {
        case .shrek:
            return "shrek"
        case .sova:
            return "sova"
        case .cat:
            return "cat"
        }
    }
}
