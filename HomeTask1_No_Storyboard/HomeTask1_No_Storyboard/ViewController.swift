//
//  ViewController.swift
//  HomeTask1_No_Storyboard
//
//  Created by Павел Яновский on 09.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Создаем зеленый прямоугольник с надписью "Логотип"
        let logoLabel = UILabel()
        logoLabel.text = "Логотип"
        logoLabel.textColor = .black
        logoLabel.textAlignment = .center
        logoLabel.font = UIFont.boldSystemFont(ofSize: 20)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoLabel)
        let greenView = UIView()
        greenView.addSubview(logoLabel)
        logoLabel.centerXAnchor.constraint(equalTo: greenView.centerXAnchor).isActive = true
        logoLabel.centerYAnchor.constraint(equalTo: greenView.centerYAnchor).isActive = true

        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenView)
        
        // Создаем желтый прямоугольник с надписью "Авторизация"
        let authLabel = UILabel()
        authLabel.text = "Авторизация"
        authLabel.textColor = .black
        authLabel.textAlignment = .center
        authLabel.font = UIFont.boldSystemFont(ofSize: 20)
        authLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(authLabel)
        let yellowView = UIView()
        yellowView.addSubview(authLabel)
        authLabel.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        authLabel.centerYAnchor.constraint(equalTo: yellowView.centerYAnchor).isActive = true

        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yellowView)
        
        // Создаем текстовое поле для логина
        let loginTextField = UITextField()
        loginTextField.placeholder = "Логин"
        loginTextField.borderStyle = .roundedRect
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextField)
        
        // Создаем текстовое поле для пароля
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Пароль"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        // Создаем кнопку для входа
        let loginButton = UIButton()
        loginButton.setTitle("Войти", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        // Устанавливаем констрейнты для элементов на экране
        NSLayoutConstraint.activate([
            // Для зеленого прямоугольника и надписи "Логотип"
            
            greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            greenView.widthAnchor.constraint(equalTo: loginButton.widthAnchor),
            greenView.heightAnchor.constraint(equalTo: loginButton.heightAnchor),
            
            logoLabel.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),
            logoLabel.centerYAnchor.constraint(equalTo: greenView.centerYAnchor),
            
            // Для желтого прямоугольника и надписи "Авторизация"
            yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellowView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 20),
            yellowView.widthAnchor.constraint(equalTo: loginButton.widthAnchor, multiplier: 1.3 ),
            yellowView.heightAnchor.constraint(equalTo: loginButton.heightAnchor),
            
            authLabel.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor),
            authLabel.centerYAnchor.constraint(equalTo: yellowView.centerYAnchor),
            
            // Для текстовых полей и кнопки
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 20),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

}

