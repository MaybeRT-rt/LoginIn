//
//  TaskViewController.swift
//  LoginIn
//
//  Created by Liz-Mary on 30.10.2024.
//

import UIKit

class TaskViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    
    private var taskTableView = TaskView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupUI() {
        view.addSubview(taskTableView)
        
        taskTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Tasks".uppercased()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
    }
    
    @objc private func addButtonTapped() {
        print("Pressed")
    }
    
}

extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    private func setupTableView() {
        taskTableView.tableView.delegate = self
        taskTableView.tableView.dataSource = self
        taskTableView.tableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
    }
}
