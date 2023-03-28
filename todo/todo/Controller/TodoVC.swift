//
//  ViewController.swift
//  todo
//
//  Created by Евгений Михневич on 05.07.2022.
//

import UIKit

class TodoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var todoItemTextField: UITextField!
    @IBOutlet weak var todoPrioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var todoTableView: UITableView!
    
    var todos = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        getTodos()
    }

    func getTodos(){

        NetworkService.shared.getTodos { todos in
            self.todos = todos.items
            self.todoTableView.reloadData()
        } onError: { errorMessage in
            debugPrint(errorMessage)
        }
        
    }
    
    @IBAction func addTodoBtn(_ sender: Any) {
        
        guard let todoItem = todoItemTextField.text else {
            return
        }
        
        let todo = Todo(item: todoItem, priority: todoPrioritySegmentedControl.selectedSegmentIndex)
        
        NetworkService.shared.addTodo(todo: todo) { todos in
            self.todoItemTextField.text = ""
            self.todos = todos.items
            self.todoTableView.reloadData()
        } onError: { errorMessage in
            debugPrint(errorMessage)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell") as? TodoTableViewCell {
            cell.updateCell(todo: todos[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    
}

