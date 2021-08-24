//
//  PostViewController.swift
//  MedisageTest
//
//  Created by Abhi on 22/08/21.
//

import UIKit
import CoreData

class PostViewController: UIViewController {
    
    var postArray : [PostElement] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callWebService()
        //        deleteAllData("MedisageTestEntity")
    }
    
    func callWebService() {
        let str = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: str)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.postArray = try JSONDecoder().decode([PostElement].self, from: data!)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    
    func createItem(title : String, body : String){
        let newItem = MedisageTestEntity(context: context)
        newItem.title = title
        newItem.body = body
        do{
            try context.save()
        }catch{
            //error
        }
    }
    
    
    func deleteAllData(_ entity:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
            }
            print("Deleted All data")
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
    
    
    
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        if let oldIndex = tableView.indexPathForSelectedRow {
//            tableView.cellForRow(at: oldIndex)?.accessoryType = .none
//        }
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        return indexPath
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel!.text = postArray[indexPath.row].title
        cell?.detailTextLabel?.text = postArray[indexPath.row].body
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = postArray[indexPath.row]
        createItem(title: item.title!, body: item.body!)
    }
}
