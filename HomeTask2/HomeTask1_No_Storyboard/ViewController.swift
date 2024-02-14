//
//  ViewController.swift
//  HomeTask1_No_Storyboard
//
//  Created by Павел Яновский on 09.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // Добавляем логотип
    private var logo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "logo"))
        return logo
    }()
    
    // Добавляем напись Авторизация
    private var headingLabel: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textAlignment = .center
        label.textColor = .black
        //label.backgroundColor = .blue
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        return label
    }()
    
    // Добавляем текстовые поля для вводв логина и пароля
    private var loginInput: UITextField = {
        let input = UITextField()
        input.borderStyle = .roundedRect
        input.placeholder = "Логин"
        input.font = UIFont.systemFont(ofSize: 22)
        input.textColor = .black
        input.backgroundColor = .white
        return input
    }()
    private var passwordInput: UITextField = {
        let input = UITextField()
        input.isSecureTextEntry = true
        input.borderStyle = .roundedRect
        input.placeholder = "Пароль"
        input.font = UIFont.systemFont(ofSize: 22)
        input.textColor = .black
        input.backgroundColor = .white
        return input
    }()
    
    // Добавляем кнопку входа
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemPurple, for: .highlighted)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "ViewController"
        setupUI()
    }

    private func setupUI() {
        view.addSubview(logo)
        view.addSubview(headingLabel)
        view.addSubview(loginInput)
        view.addSubview(passwordInput)
        view.addSubview(loginButton)
        сonstraints()
    }
    
    private func сonstraints() {
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        loginInput.translatesAutoresizingMaskIntoConstraints = false
        passwordInput.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // настраиваем логотип
            
            // Отступ от выреза под датчики 80
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            // Располагаем центр х картинки по центру х вью
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Задаём ширину
            logo.widthAnchor.constraint(equalToConstant: 250),
            // Высоту подстраиваем атоматически пропорционально ширине
            logo.heightAnchor.constraint(equalTo: logo.widthAnchor, multiplier: (logo.image?.size.height ?? 1) / (logo.image?.size.width ?? 1)),
            
            // настраиваем надпись авторизация
            
            // Отступаем от логотипа 40
            headingLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 40),
            // Располагаем центр х лейбла по центру х вью
            headingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headingLabel.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
            headingLabel.heightAnchor.constraint(equalToConstant: 60),
            
            // настраиваем поле для ввода логина
            
            // Отступаем от заголовка 40
            loginInput.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 40),
            // Располагаем центр х лейбла по центру х вью
            loginInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginInput.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
            loginInput.heightAnchor.constraint(equalToConstant: 50),
            
            // настраиваем поле для ввода пароля
            
            // Отступаем от поля для ввода логина 20
            passwordInput.topAnchor.constraint(equalTo: loginInput.bottomAnchor, constant: 20),
            // Располагаем центр х лейбла по центру х вью
            passwordInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordInput.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
            passwordInput.heightAnchor.constraint(equalToConstant: 50),
            
            // настраиваем кнопку входа
            
            // Отступаем от поля для ввода пароля 30
            loginButton.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: 30),
            // Располагаем центр х лейбла по центру х вью
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

// MARK: objc methods

// Создаём расширение для выноса всех objc-методов, чтобы лучше ориентироваться по коду
private extension ViewController {
    
    // По тапу на кнопке - переход к трём контроллерам с навигацией между собой через UITabBarController.
    @objc func tap() {
        
        // UITableViewController
        let tabl = UINavigationController(rootViewController: FriendsViewController())
        // Оборачиваем в UINavigationController, чтобы у каждого контроллера отображался свой собственный заголовок
        // UITableViewController
        let tab2 = UINavigationController(rootViewController: GroupsViewController())
        // UICollectionViewController
        let tab3 = UINavigationController(rootViewController: PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        tabl.tabBarItem.title = "Friends"
        tab2.tabBarItem.title = "Groups"
        tab3.tabBarItem.title = "Photos"
        
        let tabs = [tabl, tab2, tab3]
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = tabs
        
    
        // Получаем первую сцену, а из неё - первое окно.
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let firstWindow = firstScene.windows.first else {
            return
        }
        // Говорим окну, что у него корневой контроллер не тот, который мы задали в SceneDelegate, а наш tabBarController.
        firstWindow.rootViewController = tabBarController
    }
}


