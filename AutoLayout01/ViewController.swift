//
//  ViewController.swift
//  AutoLayout01
//
//  Created by Gerson Janhuel on 10/08/20.
//  Copyright © 2020 Elcode Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cardView1 = UIView()
    var cardView2 = UIView()
    var cardView3 = UIView()
    var cardView4 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupConstraints()
        
        setupCardDetail(parentView: cardView1, withEjomi: "☝🏻", cardName: "One \nTwo \n Three")
        setupCardDetail(parentView: cardView2, withEjomi: "✌🏻", cardName: "Two")
        setupCardDetail(parentView: cardView3, withEjomi: "🤟🏻", cardName: "Three")
        setupCardDetail(parentView: cardView4, withEjomi: "✋🏻", cardName: "Five")
        
    }
    
    private func setupSubviews() {
        addNewSubview(view: cardView1, color: .green)
        addNewSubview(view: cardView2, color: .red)
        addNewSubview(view: cardView3, color: .yellow)
        addNewSubview(view: cardView4, color: .orange)
    }
    
    private func addNewSubview(view: UIView, color: UIColor) {
        view.backgroundColor = color
        self.view.addSubview(view)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        cardView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView1.topAnchor.constraint(equalTo: safeArea.topAnchor),
            cardView1.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            cardView1.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
            cardView1.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
        ])
        
        cardView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView2.topAnchor.constraint(equalTo: cardView1.topAnchor),
            cardView2.leadingAnchor.constraint(equalTo: cardView1.trailingAnchor),
            cardView2.widthAnchor.constraint(equalTo: cardView1.widthAnchor),
            cardView2.heightAnchor.constraint(equalTo: cardView1.heightAnchor),
        ])
        
        cardView3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView3.topAnchor.constraint(equalTo: cardView1.bottomAnchor),
            cardView3.leadingAnchor.constraint(equalTo: cardView1.leadingAnchor),
            cardView3.widthAnchor.constraint(equalTo: cardView1.widthAnchor),
            cardView3.heightAnchor.constraint(equalTo: cardView1.heightAnchor),
        ])
        
        cardView4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView4.topAnchor.constraint(equalTo: cardView2.bottomAnchor),
            cardView4.leadingAnchor.constraint(equalTo: cardView3.trailingAnchor),
            cardView4.widthAnchor.constraint(equalTo: cardView1.widthAnchor),
            cardView4.heightAnchor.constraint(equalTo: cardView1.heightAnchor),
        ])
        
    }
    
    private func setupCardDetail(parentView: UIView, withEjomi: String, cardName: String) {
        
        // lets add content inside each card
        let cardContent1 = UIView()
        cardContent1.backgroundColor = .white
        cardContent1.layer.cornerRadius = 15
        
        parentView.addSubview(cardContent1)
        
        // setup constraints for cardContent1
        cardContent1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardContent1.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 20),
            cardContent1.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            //cardContent1.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -70),
            cardContent1.widthAnchor.constraint(equalTo: parentView.widthAnchor, constant: -40),
            
        ])
        
        // set emoji
        let emojiLabel = UILabel()
        emojiLabel.text = withEjomi
        emojiLabel.textAlignment = .center
        emojiLabel.font = .systemFont(ofSize: 90)
        
        parentView.addSubview(emojiLabel)

        // setup emoji constraints
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emojiLabel.centerXAnchor.constraint(equalTo: cardContent1.centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: cardContent1.centerYAnchor),
        ])
        
        
        // set card name label
        let cardLabel = UILabel()
        cardLabel.text = cardName
        cardLabel.numberOfLines = 0
        cardLabel.textAlignment = .center
        cardLabel.backgroundColor = .gray
        
        parentView.addSubview(cardLabel)
        
        // setup card name constraints
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           // cardLabel.topAnchor.constraint(equalTo: cardContent1.bottomAnchor, constant: 10),
            cardLabel.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 20),
            cardLabel.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -20),
            cardLabel.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -10),
            
            cardContent1.bottomAnchor.constraint(equalTo: cardLabel.topAnchor, constant: -10)
        ])
        
        
    }


}

