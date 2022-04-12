//
//  ViewController.swift
//  ToDoCoreData
//
//  Created by Вячеслав Квашнин on 11.04.2022.
//

import UIKit

protocol TaskViewControllerDelegate {
    func reloadData()
}

class TasksViewController: UITableViewController {
    
    private let cellTask = "cellTask"
    private var taskList: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationTitle()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellTask)
        fetchData()
    }
    
    private func setupNavigationTitle() {
        title = "Tasks"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .blue
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addTask))
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    @objc private func addTask() {
        let newTaskVC = NewTaskViewController()
        newTaskVC.delegate = self
        present(newTaskVC, animated: true)
    }
    
    private func fetchData() {
        StorageManager.shared.fetchData { taskList in
            self.taskList = taskList
        }
    }
}

// MARK: - UITableViewDataSource

extension TasksViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTask, for: indexPath)
        let task = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task.title
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - TaskViewControllerDelegate

extension TasksViewController: TaskViewControllerDelegate {
    func reloadData() {
        fetchData()
        tableView.reloadData()
    }
}
