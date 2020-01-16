//
//  ViewController.swift
//  ArtGallery
//
//  Created by Andreea Lavinia Ionescu on 15/01/2020.
//  Copyright © 2020 Orange Labs Romania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var exploreButton: UIButton!
    
    @IBOutlet weak var introView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var labelCenterConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        customizeClearNavigation()
        titleLabel.text = "ART Gallery"
        backgroundImageView.image = UIImage(named: "IntroImage")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateTitle()
    }

    func setTheNavigationTitle() {
        title = "ART Gallery"
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func customizeClearNavigation() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func animateTitle() {
        self.labelCenterConstraint.constant = -1 * (self.view.frame.size.height / 2.0 - self.titleLabel.frame.size.height)

        UIView.animate(withDuration: 3.0,
                       animations: {
                        self.exploreButton.isHidden = false
                        self.introView.layoutSubviews()
        }) { (_) in
            self.titleLabel.isHidden = true
            self.setTheNavigationTitle()
            self.addALabelProgramatically()
        }
    }
    
    func addALabelProgramatically() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        label.textAlignment = .center
        label.text = "The Louvre Museum"

        //To set the color
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white

        //To set the font Dynamic
        label.font = UIFont(name: "Helvetica-Bold", size: 40.0)

        //To set the system font
        label.font = UIFont.systemFont(ofSize: 40.0)

        //To display multiple lines
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping //Wrap the word of label
        label.lineBreakMode = .byCharWrapping //Wrap the charactor of label

        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([label.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                                                    constant: -200),
                                    label.heightAnchor.constraint(equalToConstant: 50)])
        
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        label.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
//        label.heightAnchor.constraint(equalToConstant: 50.0).isActive = true

    }
    
    func detailsAction() {
        let detailsViewController = storyboard?.instantiateViewController(withIdentifier: "ImageGalleryViewController") as! ImageGalleryViewController
        navigationController?.pushViewController(detailsViewController, animated: true)
    }


}

