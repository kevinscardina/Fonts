//
//  ViewController.swift
//  Fonts
//
//  Created by Kevin Scardina on 4/9/19.
//  Copyright © 2019 Kevin Scardina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var isCustom = false
    
    let allTextStyles: [(UIFont.TextStyle, String)] = [(.body, "Body"), (.callout, "Callout"), (.caption1, "Caption 1"),
                                                       (.caption2, "Caption 2"), (.footnote, "Footnote"), (.headline, "Headline"),
                                                       (.largeTitle, "Large Title"), (.subheadline, "Subheadline"),
                                                       (.title1, "Title 1"), (.title2, "Title 2"), (.title3, "Title 3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutView()
    }
    
    @IBAction func switchChanged(_ sender: Any?) {
        guard let swtch = sender as? UISwitch else {
            return
        }
        
        isCustom = swtch.isOn
        
        layoutView()
    }
    
    private func layoutView() {
        view.subviews.forEach { $0.removeFromSuperview() }
        
        let swtch = UISwitch()
        swtch.isOn = isCustom
        swtch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(swtch)
        swtch.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        swtch.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor).isActive = true
        swtch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: swtch.bottomAnchor, constant: 8).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        var previousLabel: UILabel?
        allTextStyles.forEach({ (tuple) in
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.adjustsFontForContentSizeCategory = true
            label.numberOfLines = 0
            if isCustom {
                label.font = UIFontMetrics(forTextStyle: tuple.0).scaledFont(for: UIFont.systemFont(ofSize: 32))
            } else {
                label.font = UIFont.preferredFont(forTextStyle: tuple.0)
            }
            label.text = tuple.1
            scrollView.addSubview(label)
            label.topAnchor.constraint(equalTo: previousLabel == nil ? scrollView.topAnchor : previousLabel!.layoutMarginsGuide.bottomAnchor, constant: 18).isActive = true
            label.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
            label.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
            previousLabel = label
        })
        if let label = previousLabel {
            label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        }
    }
}

