//
//  SignInViewController.swift
//  pizza
//
//  Created by Баэль Рыспеков on 4/4/23.
//

import UIKit

class SignIn: UIViewController {
    
    private  var controller: SignInController!
    var auth = Auth()
    // MARK: - Create UIElements
    
    private lazy var login_label: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        return label
    }()
    
    private lazy var continue_label: UILabel = {
        let label = UILabel()
        label.text = "Please sign in to continue"
        label.font = .systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        label.textColor = Color.gray
        return label
    }()
    
    private lazy var emailTF: UITextField = {
        let view = UITextField()
        view.placeholder = "email"
        
        view.backgroundColor = .white
        view.layer.shadowColor = Color.shadow.cgColor
        view.layer.shadowOpacity = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    
    private lazy var passwordTF: UITextField = {
        let view = UITextField()
        view.placeholder = "password"
        
        view.backgroundColor = .white
        view.layer.shadowColor = Color.shadow.cgColor
        view.layer.shadowOpacity = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    
    private lazy var login_button: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9882199168, green: 0.6642766595, blue: 0.2534056902, alpha: 1)
        button.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        return button
    }()
    
    
    private let dontAC: UILabel = {
        let label = UILabel()
        label.text = "Don’t have an account?"
        label.textColor = Color.gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
        
    private let signUp_action: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textColor  =  #colorLiteral(red: 0.9882199168, green: 0.6642766595, blue: 0.2534056902, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let container: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = SignInController(view: self)
        setupSubViews()
        eventHandler()
    }
   
   
    
    func eventHandler(){
        
    }
    
    @objc func logIn () {
        if emailTF.text?.isEmpty ?? true  {
            let alertController = UIAlertController(title: "Ошибка", message: "Пожалуйста, заполните все поля", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        } else {
            auth.isAuth = true
            print("work")
       
        }
        
       
   
    }
    
    private func setupSubViews () {
        
        // MARK: - Add UIElements
        
        [login_label, continue_label, emailTF, passwordTF, login_button, container].forEach { box in
                       view.addSubview(box)
        }
        
        login_label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview()
        }
        
        continue_label.snp.makeConstraints { make in
            make.top.equalTo(login_label.snp.bottom).offset(10)
            make.leading.equalTo(login_label.snp.leading)
        }
        
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(continue_label.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        
        login_button.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp.bottom).offset(50)
            make.trailing.equalToSuperview().offset(-30)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        container.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
        
        
        [dontAC, signUp_action].forEach { box in
                       container.addSubview(box)
        }
        
        dontAC.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        signUp_action.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(dontAC.snp.trailing).offset(2)
            make.trailing.equalToSuperview()
        }
      
        
    }
    
}
