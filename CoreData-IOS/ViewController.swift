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
        
        products.setValue("Papel Higienico", forKey: "descricao")
        products.setValue("Branco", forKey: "cor")
        products.setValue(8.50, forKey: "preco")
        
        
        do {
            try context.save()
            print("Os Dados Foram Salvos")
            
        } catch  {
            print("Erro ao salvar dados")
        }
        
        
        
        /*
         LISTANDO PRODUTOS
         */
        
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
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
        
    }
    
 
        
    
    
    
    


}

