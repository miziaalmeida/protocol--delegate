//
//  ViewController.swift
//  desafioLogin
//
//  Created by Mizia Lima on 9/15/20.
//  Copyright © 2020 Mizia Lima. All rights reserved.
//

import UIKit

class Usuario {
    private var email: String
    private var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    func getPassword() -> String {
        return self.password
    }
    
    func setEmail(_ email: String) {
        print(email)
        self.email = email
    }
    
    func setPassword(_ password: String) {
        print(password)
        self.password = password
    }
}

class ViewController: UIViewController {
    
    var usuario: Usuario = Usuario(email: "", password: "")
    var usuariosCadastrados = [Usuario]()
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var btnAcess: UIButton!
    
    @IBAction func btnAcessAction(_ sender: Any) {
        if usuariosCadastrados.count == 0 {
            usuario.setEmail(textFieldEmail.text!)
            usuario.setPassword(textFieldPassword.text!)
            usuariosCadastrados.append(usuario)
            
            textFieldEmail.text = ""
            textFieldPassword.text = ""
        }
        else {
            for item in usuariosCadastrados {
                if(item.getEmail() == textFieldEmail.text!){
                    mostrarAlerta("Usuario já cadastrado! Tente outro!")
                    view.backgroundColor = UIColor.red
                    break
                }
                usuario.setEmail(textFieldEmail.text!)
                usuario.setPassword(textFieldPassword.text!)
                usuariosCadastrados.append(usuario)
                
                textFieldEmail.text = ""
                textFieldPassword.text = ""
                
                view.backgroundColor = UIColor.green
            }
        }
        
        print(usuario.getEmail())
    }
    
    //Cria funcao para mostrar alerta e trocar a cor da tela
    private func mostrarAlerta(_ mensagem: String) {
        // Comeca alerta
        let alert = UIAlertController(title: "Atenção", message: mensagem, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) {
            (UIAlertAction) in
        }
        alert.addAction(okAction)
        self.present(alert, animated: true) {
            
        }
        // Termina alerta
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnAcess.isEnabled = true
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
    }
    
    private func validarInformacoesTextField() -> Bool {
        if textFieldEmail.text == nil || textFieldEmail.text!.isEmpty{
            mostrarAlerta("Falta o email!")
            return false
        }
        if textFieldPassword.text == nil || textFieldPassword.text!.isEmpty{
        mostrarAlerta("Falta a senha!")
        return false
}
        return true
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldEmail {
            textFieldPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
