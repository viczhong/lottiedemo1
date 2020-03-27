//
//  ViewController.swift
//  LottieDemo1
//
//  Created by Victor Zhong on 3/27/20.
//  Copyright © 2020 Victor Zhong. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    var animations = [AnimationView]()

    lazy var stackView: UIStackView = createStack(jsonNames: [
        "lottiedata",
        "servishero_loading",
        "boat",
        "9squares"
    ])

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        guard let _ = UIFont(name: "BureauGrotExtraCompressed-Bold", size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the "Bureau Grot Extra Compressed Bold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        
        setupDesign()
    }

    func setupDesign() {
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        animations.forEach { (view) in
            view.play()
        }
    }

    func createStack(jsonNames: [String]) -> UIStackView {
        let stackView = UIStackView()

        for name in jsonNames {
            let view = AnimationView(name: name)
            view.animationSpeed = 1
            view.loopMode = .loop
            view.contentMode = .scaleAspectFit
            view.translatesAutoresizingMaskIntoConstraints = false
            animations.append(view)
            stackView.addArrangedSubview(view)
        }

        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }

}

