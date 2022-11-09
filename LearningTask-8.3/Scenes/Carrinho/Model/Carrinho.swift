//
//  ItemDeCompra.swift
//  LearningTask-8.3
//
//  Created by Italo cavalcanti on 09/11/22.
//

import Foundation

struct ItemDeCompra {
    let livro: Livro
    let tipoSelecionado: TipoDeLivro
    
    var preco: Decimal {
        return livro.precos
            .filter{ $0.tipoDeLivro == tipoSelecionado}
            .map{ $0.valor }
            .reduce(.zero, +)
    }
}

struct Carrinho {
    private(set) var itens: [ItemDeCompra] = []
    
    var total: Decimal {
        return itens
            .map{ $0.preco }
            .reduce(.zero, +)
    }
    
    mutating func adiciona(item: ItemDeCompra) {
        itens.append(item)
    }
    
    static func criarCarrinho(com livro: Livro, doTipo tipoDeLivro: TipoDeLivro) -> Carrinho {
        let item = ItemDeCompra(livro: livro, tipoSelecionado: tipoDeLivro)
        return .init(itens: [item])
    }
    
}
