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
        
        // criando requisição para buscar os dados
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        do {
            let usuarios = try context.fetch(requisicao)
            if usuarios.count > 0{
                
                for usuario in usuarios as! [NSManagedObject]{
                    if let nomeUsuario = usuario.value(forKey: "nome"){
                        print(nomeUsuario)

                    }
                }
                
            }else{
                print("Nenhum usuario encontrado")
            }
        } catch  {
            print("Erro ao recuperar Usuario")
        }
        
        
        /*
         Criando Entidade
 
        let user = NSEntityDescription.insertNewObject(forEntityName: "Usuario",into:context)
        
        user.setValue("Bruna mendes", forKey: "nome")
        user.setValue(23, forKey: "idade")
        user.setValue("bruninhadorme@dorme.com", forKey: "login")
        user.setValue("123455", forKey: "senha")
        
        //salvando
        
        do {
            try context.save()
            print("Os Dados Foram Salvos")

        } catch  {
            print("Erro ao salvar dados")
        }
  */
        
        
    }
    


}

