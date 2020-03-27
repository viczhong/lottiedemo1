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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDesign()
    }

    func setupDesign() {
        let stack = createStack(jsonNames: ["lottiedata", "servishero_loading"])
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
            view.contentMode = .scaleAspectFill
            view.translatesAutoresizingMaskIntoConstraints = false
            animations.append(view)
            stackView.addArrangedSubview(view)
        }

        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        return stackView
    }

}

