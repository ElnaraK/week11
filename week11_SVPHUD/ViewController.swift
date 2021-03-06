//
//  ViewController.swift
//  week11_SVPHUD
//
//  Created by Elnara  on 3/28/20.
//  Copyright © 2020 Elnara . All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
    
        super.viewDidAppear(animated)
        
        SVProgressHUD.show()
        view.backgroundColor = UIColor.yellow
        DispatchQueue.global(qos: .background).async {
            self.download()
            self.bigTask()
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
            }
        }
    }
    
    func bigTask() {
        for i in 0...1000000 {
            print(i)
        }
    }
    
    func download() {
        guard let url = URL(string: "https://gorest.co.in/public-api/users?_format=json&access-token=4vzWPKrz6cvdFkQ-_33ce_XUFnmmKmUrnuNd") else
        { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print(error)
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(DownloadResponse.self, from: data)
                
                print(response.users.map { $0.first_name })
                DispatchQueue.main.async {
                    self.view.backgroundColor = UIColor.green
                }
            } catch {
                DispatchQueue.main.async {
                    self.view.backgroundColor = UIColor.red
                }
                print(error)
            }
        }
        task.resume()
    }

   
}
class DownloadResponse: Codable {
    var users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "result"
    }
}
