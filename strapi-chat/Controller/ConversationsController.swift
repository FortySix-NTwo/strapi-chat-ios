//
//  ConversationsController.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 08/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import UIKit

class ConversationsController: UIViewController {
    
    //  MARK: @Properties
    private let tableView = UITableView()
    private let reuseIdentifer = "ConversationsCell"
    
    //  MARK: @LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //  MARK: @Selectors
    @objc func showProfile(){
        print(123)
    }
    
    //  MARK: @Helpers
    func configureUI() {
        view.backgroundColor = .white
        configureNavigationBar()
        configureTableView()
        
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showProfile))
    }
    
    func configureNavigationBar() {
        let appearane = UINavigationBarAppearance()
        appearane.configureWithOpaqueBackground()
        appearane.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearane.backgroundColor = .systemTeal
        
        navigationController?.navigationBar.standardAppearance = appearane
        navigationController?.navigationBar.compactAppearance = appearane
        navigationController?.navigationBar.scrollEdgeAppearance = appearane
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
    
    func configureTableView() {
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifer)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
}

//  MARK: @Extensions
extension ConversationsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath)
        cell.textLabel?.text = "Test Cell"
        return cell;
    }
}

extension ConversationsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
