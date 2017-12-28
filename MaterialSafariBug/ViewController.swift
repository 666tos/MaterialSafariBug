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

    @IBAction private func openBuggySafariPressed() {
        guard let url = URL(string: "https://google.com") else {
            return
        }
        
        let safariViewController = SFSafariViewController(url: url)
        
        let navigationController = NavigationController(rootViewController: safariViewController)
        self.present(navigationController, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction private func openSafariPressed() {
        guard let url = URL(string: "https://google.com") else {
            return
        }
        
        let safariViewController = SFSafariViewController(url: url)
        
        let navigationController = CustomNavigationController(rootViewController: safariViewController)
        self.present(navigationController, animated: true)
    }
}

class CustomNavigationController: NavigationController {
    override func prepare() {
        
        // Do the same as NavigationController does, but not calling 'isMotionEnabled = true'.
        // Enabling motion causes SFSafariViewController to not loading content
        
//        isMotionEnabled = true
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.contentScaleFactor = Screen.scale
        
        let navigationBar = self.navigationBar as! NavigationBar
        navigationBar.frame.size.width = view.bounds.width
        navigationBar.heightPreset = .normal
        
        // This ensures the panning gesture is available when going back between views.
        if let v = interactivePopGestureRecognizer {
            v.isEnabled = true
            v.delegate = self
        }
    }
}
