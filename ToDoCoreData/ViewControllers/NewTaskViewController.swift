//
//  NewTaskViewController.swift
//  ToDoCoreData
//
//  Created by Вячеслав Квашнин on 11.04.2022.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    var delegate: TaskViewControllerDelegate?
    
    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "New Task"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var addButton: CustomButton = {
        let button = CustomButton(title: "Add Task")
        return button
    }()
    
    private lazy var cancelButton: CustomButton = {
        let button = CustomButton(title: "Cancel")
        button.addTarget(self, action: #selector(cancelTask), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubview(taskTextField, addButton, cancelButton)
        setConstraints()
    }
    
    private func setupSubview(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    @objc private func cancelTask() {
        dismiss(animated: true)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate(setConstraintsForAnchor(subView: taskTextField, constantTop: 100))
        NSLayoutConstraint.activate(setConstraintsForAnchor(subView: addButton, constantTop: 180))
        NSLayoutConstraint.activate(setConstraintsForAnchor(subView: cancelButton, constantTop: 230))
    }
    
    private func setConstraintsForAnchor(subView: UIView, constantTop: CGFloat) -> [NSLayoutConstraint] {
        subView.translatesAutoresizingMaskIntoConstraints = false
        return [
            subView.topAnchor.constraint(equalTo: view.topAnchor, constant: constantTop),
            subView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            subView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ]
    }
}
