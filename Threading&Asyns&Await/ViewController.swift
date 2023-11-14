//
//  ViewController.swift
//  Threading&Asyns&Await
//
//  Created by Айбек on 14.11.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    let urlStrings = ["https://cdn.pixabay.com/photo/2016/11/14/03/46/girl-1822525_640.jpg", "https://img.freepik.com/free-photo/large-cliff-pfeiffer-beach-usa-during-sunset_181624-23134.jpg"]
    
    var data1 = Data()
    var tracker = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.global().async {
            self.data1 = try! Data(contentsOf: URL(string : self.urlStrings[self.tracker])!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data1)
            }
        }
        
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(phChan))
    }
    
    @objc func phChan() {
        if tracker == 0 {
            tracker += 1
        } else {
            tracker -= 1
        }
        DispatchQueue.global().async {
            self.data1 = try! Data(contentsOf: URL(string : self.urlStrings[self.tracker])!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data1)
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Threadind test"
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }

}

