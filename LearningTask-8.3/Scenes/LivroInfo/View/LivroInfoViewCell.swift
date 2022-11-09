//
//  LivroInfoViewCell.swift
//  LearningTask-8.3
//
//  Created by Italo cavalcanti on 09/11/22.
//

import UIKit

class LivroInfoViewCell: UITableViewCell {
    
    @IBOutlet weak var tipoLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    
    var preco: Preco? {
        didSet {
            guard let preco = preco else { return }
            tipoLabel.text = preco.tipoDeLivro.descricao
            precoLabel.text = Formatter.paraMoeda(decimal: preco.valor)
        }
    }
}
