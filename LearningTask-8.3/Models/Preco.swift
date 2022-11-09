//
//  Preco.swift
//  LearningTask-8.3
//
//  Created by Italo cavalcanti on 08/11/22.
//

import Foundation

struct Preco {
    var valor: Double
    var tipoDeLivro: TipoDeLivro
    
    enum TipoDeLivro: String {
        case ebook = "E-book"
        case impresso = "Impresso"
        case combo = "E-book + impresso"
    }
}
