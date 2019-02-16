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
        let aa  = UIApplication.shared.delegate as! AppDelegate
        let bb = aa.persistentContainer.viewContext
        
        /*
         Criando Entidade
         */
        let user = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: bb)
        _ = NSEntityDescription.insertNewObject(forEntityName: "Usuario",into:context)
        
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
    }
    


}

