//
//  ViewController.swift
//  ThreadinProject
//
//  Created by Muhammed fatih Elçi on 15.12.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    let urlStrings = ["https://pitreonline.com/wp-content/uploads/2019/01/6823214-large.jpg","https://upload.wikimedia.org/wikipedia/commons/7/74/Earth_poster_large.jpg","https://www.northlight-images.co.uk/wp-content/uploads/2015/05/pan_h_002336_lake-20x53p.jpg"]
    
    var data = Data()
    var tracker = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlStrings[self.tracker])!)//background thread
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data)//main thread
            }
        }
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(changeImage))
    }

    @objc func changeImage(){
        if tracker == 0 {
            tracker += 1
        }else {
            tracker -= 1
        }
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlStrings[self.tracker])!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data)
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Threading test"
        return cell
    }
}

