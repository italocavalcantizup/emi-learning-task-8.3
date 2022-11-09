//
//  LivroInfoViewController.swift
//  LearningTask-8.3
//
//  Created by Italo cavalcanti on 09/11/22.
//

import UIKit

class LivroInfoViewController: UIViewController {
    
    //View superior
    @IBOutlet private weak var tituloLabel: UILabel!
    @IBOutlet private weak var subtituloLabel: UILabel!
    @IBOutlet private weak var autorLabel: UILabel!
    @IBOutlet private weak var capaImageView: UIImageView!
    
    //View Tipos
    @IBOutlet weak var precoEbookLabel: UILabel!
    @IBOutlet weak var precoImpressoLabel: UILabel!
    @IBOutlet weak var precoComboLabel: UILabel!
    
    var livro: Livro!
    var tipoSelecionado: TipoDeLivro?

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private func setupViews() {
        setupViewSuperior()
        setupViewTipos()
    }
    
    private func setupViewTipos() {
        for preco in livro.precos {
            let valor = Formatter.paraMoeda(decimal: preco.valor)
            switch preco.tipoDeLivro {
            case .ebook:
                precoEbookLabel.text = valor
            case .impresso:
                precoImpressoLabel.text = valor
            case .combo:
                precoComboLabel.text = valor
            }
        }
    }
    
    private func setupViewSuperior() {
        tituloLabel.text = livro.titulo
        subtituloLabel.text = livro.subtitulo
        autorLabel.text = livro.autor?.nomeCompleto
        capaImageView.image = UIImage(named: livro.imagemDeCapaURI)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "seeCarrinhoViewController" else { return }
        guard let botao = sender as? UIButton,
              let destino = segue.destination as? CarrinhoViewController else {
            fatalError("Não foi possível executar a segue: \(segue.identifier!)")
        }
        destino.carrinho = Carrinho.criarCarrinho(com: livro, doTipo: TipoDeLivro(rawValue: botao.tag)!)
    }
    
}
