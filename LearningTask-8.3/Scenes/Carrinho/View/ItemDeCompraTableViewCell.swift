//
//  ItemDeCompraTableViewCell.swift
//  LearningTask-8.3
//
//  Created by Italo cavalcanti on 09/11/22.
//

import UIKit

class ItemDeCompraTableViewCell: UITableViewCell {

    @IBOutlet weak var capaImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var autorLabel: UILabel!
    @IBOutlet weak var tipoLabel: UILabel!
    @IBOutlet weak var valorLabel: UILabel!
    
    var preco: Preco? {
        didSet {
            guard let preco = preco else { return }
            
            tipoLabel.text = preco.tipoDeLivro.descricao
            valorLabel.text = Formatter.paraMoeda(decimal: preco.valor)
        }
    }
    var livro: Livro? {
        didSet {
            guard let livro = livro else { return }
            
            capaImageView.image = UIImage(named: livro.imagemDeCapaURI)
            tituloLabel.text = livro.titulo
            autorLabel.text = livro.autor?.nomeCompleto
        }
    }
    
}
