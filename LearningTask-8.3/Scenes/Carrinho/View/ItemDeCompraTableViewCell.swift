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
    
    var itemDeCompra: ItemDeCompra? {
        didSet {
            guard let compra = itemDeCompra else { return }
            capaImageView.image = UIImage(named: compra.livro.imagemDeCapaURI)
            tituloLabel.text = compra.livro.titulo
            autorLabel.text = compra.livro.autor?.nomeCompleto
            tipoLabel.text = String(describing: compra.tipoSelecionado)
            valorLabel.text = Formatter.paraMoeda(decimal: compra.preco)
        }
    }
}
