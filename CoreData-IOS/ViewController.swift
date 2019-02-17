//
//  ViewController.swift
//  CoreData-IOS
//
//  Created by Allef Sousa Santos on 16/02/19.
//  Copyright © 2019 Allef Sousa Santos. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Fazendo refencia a classe app delegate que contem os metodos para manipular o banco de dadaos (Core Data)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        /*
         SALVANDO PRODUTOS
         */
        let products = NSEntityDescription.insertNewObject(forEntityName: "Produto",into:context)
        
        products.setValue("salgadinho", forKey: "descricao")
        products.setValue("Branco", forKey: "cor")
        products.setValue(5.00, forKey: "preco")
        
        
        do {
            try context.save()
            print("Os Dados Foram Salvos")
            
        } catch  {
            print("Erro ao salvar dados")
        }
        
        // ORDENANDO OS PRODUTOS
        
        let ordenacaoAZ = NSSortDescriptor(key: "descricao", ascending: true)
        let predicate = NSPredicate(format: "descricao contains %@", "Bolacha")
        
        
        
        /*
         LISTANDO PRODUTOS
         */
        
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
        requisicao.sortDescriptors = [ordenacaoAZ]
        requisicao.predicate = predicate
        do {
            let prod = try context.fetch(requisicao)
            if prod.count > 0{
                
                for pro in prod as! [NSManagedObject]{
                    if let descricaoProduto = pro.value(forKey: "descricao"){
                        print(descricaoProduto)
                    }
                }
                
            }else{
                print("Nenhum usuario encontrado")
            }
        } catch  {
            print("Erro ao recuperar Usuario")
        }
        // deletando produto
//
//        do {
//            try context.delete(descricaoProduto)
//                print("Sucesso ao remover produto")
//        } catch  {
//                print("Erro ao remover produto")
//
//        }
        
    }
    
    
    
    
    
 
        
    
    
    
    


}

