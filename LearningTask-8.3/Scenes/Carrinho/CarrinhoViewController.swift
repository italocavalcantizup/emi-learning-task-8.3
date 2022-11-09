//
//  CarrinhoViewController.swift
//  LearningTask-8.3
//
//  Created by Italo cavalcanti on 09/11/22.
//

import UIKit

class CarrinhoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var valorTotalLabel: UILabel!
    
    var tipoDeLivro: TipoDeLivro!
    var livro: Livro!

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private func setupViews() {
        tableView.register(CarrinhoSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: CarrinhoSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = CarrinhoSectionHeaderView.alturaBase
        tableView.sectionHeaderTopPadding = 0
        
        valorTotalLabel.text = Formatter.paraMoeda(decimal: livro.precos[tipoDeLivro.rawValue - 1].valor)
    }
}

extension CarrinhoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDeCompraTableViewCell") as? ItemDeCompraTableViewCell else {
            fatalError("Não foi possível obter célula para a lista")
        }
        cell.livro = livro
        cell.preco = livro.precos[tipoDeLivro.rawValue - 1]
        return cell
    }
}

extension CarrinhoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CarrinhoSectionHeaderView.reuseId) as? CarrinhoSectionHeaderView else {
            fatalError("Não foi possível obter section para a tabela")
        }
        header.titulo = "Seu carrinho de compras"
        return header
    }
}
