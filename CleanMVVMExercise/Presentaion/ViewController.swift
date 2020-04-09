//
//  ViewController.swift
//  CleanMVVMExercise
//
//  Created by Song on 2020-04-09.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var loadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click to Load", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5.0
        //button.layer.borderColor = UIColor.gray.cgColor
        //button.layer.borderWidth = 1.0
        button.backgroundColor = .blue
        
        //button.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        return button
    }()
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create and add button on the view dynamatically, did not use IB
        
        view.addSubview(loadButton)
        
        //setup button constraints
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        loadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
        loadButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loadButton.addTarget(self, action: #selector(loadButtonTapped), for: .touchUpInside)
        /*
        viewModel.closureObserve = {[unowned self]keydata in
            print("view got key data - \(keydata)")
            self.loadButton.setTitle("Click to Load", for: .normal)
            let alertController = UIAlertController(title: "Last Modified", message: keydata, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }*/
        
        //create an observe by closure based Observerable, other observes could be RxSwift, KVO, protocol, ...
        viewModel.observeVariable.observe(){ [unowned self] keyData in
            print("view got key data - \(keyData)")
            //got data from view model by triggering observe
            
            //update button title
            self.loadButton.setTitle("Click to Load", for: .normal)
            
            //show up info
            let alertController = UIAlertController(title: "Last Modified", message: keyData, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }

    @objc func loadButtonTapped(sender: UIButton) {
        
        //as clicked button, update button text and lookupKeyData by viewModel
        loadButton.setTitle("Loading...", for: .normal)
        
        viewModel.lookupKeyData()
    }
}

