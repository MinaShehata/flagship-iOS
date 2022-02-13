//
//  BaseViewController.swift
//  Template-iOS
//
//  Created by Mina Shehata on 1/3/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

public class BaseViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        /////// some setups
        setupLisner()
        // TODO:- here......
    }
    
    //MARK:- Observers Or Lisner
    private func setupLisner() {
//        NotificationCenter.default.addObserver(self, selector: #selector(networkChanged(notification:)), name: .StatusChanged, object: nil)
    }
    
    
    //MARK:- network lisners
    @objc private func networkChanged(notification: Notification) {
        if let status = notification.userInfo!["connected"] as? Bool
        {
            if status {
                
            }
            else {
//                InfoAlert(title: "Connection".Localize, message: "Network offline".Localize)
            }
        }
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeLisner()
    }
    
    private func removeLisner() {
//        NotificationCenter.default.removeObserver(self, name: .StatusChanged, object: nil)
    }
    
}

