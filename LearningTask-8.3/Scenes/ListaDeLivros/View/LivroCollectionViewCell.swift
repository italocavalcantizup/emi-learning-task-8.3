//
//  LivroCollectionViewCell.swift
//  LearningTask-7.3
//
//  Created by rafael.rollo on 23/06/2022.
//

import UIKit

class LivroCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var capaImageView: UIImageView!
    @IBOutlet private weak var tituloLabel: UILabel!
   
    var livro: Livro? {
        didSet {
            guard let livro = livro else { return }

            capaImageView.image = .init(named: livro.imagemDeCapaURI)
            tituloLabel.text = livro.titulo
        }
    }
}
