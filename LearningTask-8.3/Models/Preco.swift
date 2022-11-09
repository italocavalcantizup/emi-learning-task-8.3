//
//  Preco.swift
//  LearningTask-8.3
//
//  Created by Italo cavalcanti on 08/11/22.
//

import Foundation

struct Preco {
    var valor: Decimal
    var tipoDeLivro: TipoDeLivro
}

enum TipoDeLivro: Int, CaseIterable {
    case ebook = 1
    case impresso = 2
    case combo = 3
    
    var descricao: String {
        switch self {
        case .ebook:
            return "E-book*"
        case .impresso:
            return "Impresso"
        case .combo:
            return "E-book + Impresso"
        }
    }
}
