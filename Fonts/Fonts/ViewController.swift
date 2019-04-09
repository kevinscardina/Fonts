//
//  ViewController.swift
//  Fonts
//
//  Created by Kevin Scardina on 4/9/19.
//  Copyright © 2019 Kevin Scardina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let allTextStyles: [(UIFont.TextStyle, String)] = [(.body, "Body"), (.callout, "Callout"), (.caption1, "Caption 1"),
                                                       (.caption2, "Caption 2"), (.footnote, "Footnote"), (.headline, "Headline"),
                                                       (.largeTitle, "Large Title"), (.subheadline, "Subheadline"),
                                                       (.title1, "Title 1"), (.title2, "Title 2"), (.title3, "Title 3")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.translatesAutoresizingMaskIntoConstraints = false
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        var previousLabel: UILabel?
        allTextStyles.forEach({ (tuple) in
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.font = UIFont.preferredFont(forTextStyle: tuple.0)
            label.text = tuple.1
            scrollView.addSubview(label)
            label.topAnchor.constraint(equalTo: previousLabel == nil ? scrollView.layoutMarginsGuide.topAnchor : previousLabel!.layoutMarginsGuide.bottomAnchor, constant: 18).isActive = true
            label.leftAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leftAnchor).isActive = true
            label.rightAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.rightAnchor).isActive = true
            previousLabel = label
        })
    }


}

