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
    
    @IBOutlet weak var tipoEbookLabel: UILabel!
    @IBOutlet weak var precoEbookLabel: UILabel!
    
    @IBOutlet weak var tipoImpressoLabel: UILabel!
    @IBOutlet weak var precoImpressoLabel: UILabel!
    
    @IBOutlet weak var tipoComboLabel: UILabel!
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
        tipoEbookLabel.text = livro.precos[0].tipoDeLivro.descricao
        tipoImpressoLabel.text = livro.precos[1].tipoDeLivro.descricao
        tipoComboLabel.text = livro.precos[2].tipoDeLivro.descricao
        
        precoEbookLabel.text = Formatter.paraMoeda(decimal: livro.precos[0].valor)
        precoImpressoLabel.text = Formatter.paraMoeda(decimal: livro.precos[1].valor)
        precoComboLabel.text = Formatter.paraMoeda(decimal: livro.precos[2].valor)
    }
    
    private func setupViewSuperior() {
        tituloLabel.text = livro.titulo
        subtituloLabel.text = livro.subtitulo
        autorLabel.text = livro.autor?.nomeCompleto
        capaImageView.image = UIImage(named: livro.imagemDeCapaURI)
    }
    
    
    @IBAction func comprarBotaoSelecionado(_ sender: UIButton) {
        guard let tipo = TipoDeLivro.allCases.filter({ $0.rawValue == sender.tag }).first else {
            fatalError("Não foi possível determinar o tipo de livro")
        }
        tipoSelecionado = tipo
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "seeCarrinhoViewController" else { return }
        guard let destino = segue.destination as? CarrinhoViewController else {
            fatalError("Não foi possível executar a segue: \(segue.identifier!)")
        }
        destino.tipoDeLivro = tipoSelecionado
        destino.livro = livro
    }
    
}
