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
    
    var carrinho: Carrinho? {
        didSet {
            guard isViewLoaded, let carrinho = carrinho else { return }
            atualizaViews(com: carrinho)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
        setupViews()
        
        if let carrinho = carrinho {
            atualizaViews(com: carrinho)
        }
    }
    
    func atualizaViews(com carrinho: Carrinho) {
        tableView.reloadData()
        valorTotalLabel.text = Formatter.paraMoeda(decimal: carrinho.total)
    }
    
    private func setupViews() {
        tableView.register(CarrinhoSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: CarrinhoSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = CarrinhoSectionHeaderView.alturaBase
        tableView.sectionHeaderTopPadding = 0
    }
}

extension CarrinhoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carrinho?.itens.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDeCompraTableViewCell") as? ItemDeCompraTableViewCell else {
            fatalError("Não foi possível obter célula para a lista")
        }
        cell.itemDeCompra = carrinho?.itens[indexPath.row]
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
