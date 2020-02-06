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
    
    
    private lazy var galleriesTableViewController: GalleriesTableViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "GalleriesTableViewController") as! GalleriesTableViewController
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)

        return viewController
    }()

    private lazy var galleriesCollectionViewController: GalleriesCollectionViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "GalleriesCollectionViewController") as! GalleriesCollectionViewController

        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)

        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func screenTypeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            add(asChildViewController: galleriesCollectionViewController)
        } else {
            add(asChildViewController: galleriesTableViewController)
        }
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        screenContainerView.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = screenContainerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
}
