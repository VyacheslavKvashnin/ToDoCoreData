//
//  StorageManager.swift
//  ToDoCoreData
//
//  Created by Вячеслав Квашнин on 12.04.2022.
//

import Foundation
import CoreData

class StorageManager {
    
    static var shared = StorageManager()
    
    // MARK: - Core Data stack
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    init() {}
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Core Data Fetch Data
    
    func fetchData(completion: @escaping(Result<[Task], Error>) -> Void) {
        let fetchData = Task.fetchRequest()
        do {
            let taskList = try persistentContainer.viewContext.fetch(fetchData)
            completion(.success(taskList))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func saveTask(_ taskName: String, completion: @escaping(Task) -> Void) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Task", in: persistentContainer.viewContext) else { return }
        guard let task = NSManagedObject(entity: entityDescription, insertInto: persistentContainer.viewContext) as? Task else { return }
        task.title = taskName
        completion(task)
        saveContext()
    }
    
    func deleteTask(_ task: Task) {
        persistentContainer.viewContext.delete(task)
        saveContext()
    }
    
    func updateTask(_ task: Task, changeName: String) {
        task.title = changeName
        saveContext()
    }
}
