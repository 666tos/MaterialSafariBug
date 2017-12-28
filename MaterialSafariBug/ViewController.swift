//
//  ViewController.swift
//  MaterialSafariBug
//
//  Created by M Ivaniushchenko on 12/28/17.
//

import UIKit
import SafariServices
import Material

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction private func openSafariPressed() {
        guard let url = URL(string: "https://google.com") else {
            return
        }
        
        let safariViewController = SFSafariViewController(url: url)
        
        let navigationController = NavigationController(rootViewController: safariViewController)
        self.present(navigationController, animated: true)
    }
}

