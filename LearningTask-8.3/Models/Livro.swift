//
//  Livro.swift
//  LearningTask-8.3
//
//  Created by rafael.rollo on 23/06/2022.
//

import Foundation

struct Livro {
    let titulo: String
    let subtitulo: String
    let imagemDeCapaURI: String
    let autor: Autor?
    let precos: [Preco]
    
    init(titulo: String, subtitulo: String, imagemDeCapaURI: String, autor: Autor? = nil, precos: [Preco]) {
        self.titulo = titulo
        self.subtitulo = subtitulo
        self.imagemDeCapaURI = imagemDeCapaURI
        self.autor = autor
        self.precos = precos
    }
}

struct Preco {
    var valor: Decimal
    var tipoDeLivro: TipoDeLivro
}

enum TipoDeLivro: Int, CaseIterable {
    case ebook = 0
    case impresso = 1
    case combo = 2
    
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
