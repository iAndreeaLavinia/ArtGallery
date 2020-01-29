//
//  GalleriesViewController.swift
//  ArtGallery
//
//  Created by Andreea Lavinia Ionescu on 29/01/2020.
//  Copyright © 2020 Orange Labs Romania. All rights reserved.
//

import UIKit

class GalleriesViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var screenTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var screenContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func screenTypeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            screenContainerView.isHidden = true
        } else {
            screenContainerView.isHidden = false
        }
    }
}
