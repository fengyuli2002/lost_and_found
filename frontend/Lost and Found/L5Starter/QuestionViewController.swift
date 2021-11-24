//
//  QuestionViewController.swift
//  LostandFound
//
//  Created by Vivian on 11/20/21.
//  
//
import SwiftUI

class QuestionViewController: UIViewController {
    
//    init(delegate: UpdateTitleDelegate?, placeholderText: String) {
//        self.delegate = delegate
//        self.placeholderText = placeholderText
//        super.init(nibName: nil, bundle: nil)
//    }
    init(){
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // TODO 1: set up view
    var Lost = UIButton()
    var Found = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Shapes"
        view.backgroundColor = UIColor(red: 0.325, green: 0.38, blue: 0.424, alpha: 1)
        

        setupViews()
        setupConstraints()
    }
    
    func setupViews(){

        self.navigationItem.hidesBackButton = true;//You may never come back!
        
        //Lost
        Lost.layer.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor
        Lost.layer.cornerRadius = 20//weird. when this number gets bigger, the button apperance
                                    //would become acute on the very left and right corner. verify.
        Lost.setTitle("Lost Something?", for: .normal)
        Lost.setTitleColor(.black, for: .normal)
        Lost.addTarget(self, action: #selector(lostTableTapped), for: .touchUpInside)
        Lost.translatesAutoresizingMaskIntoConstraints = false
        //well the font of the text is set in setUpConstraints(). Check to see why. interesting.
        view.addSubview(Lost)
        
    
        //Found
        Found.layer.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor
        Found.layer.cornerRadius = 20
        Found.setTitle("Found Something?", for: .normal)
        Found.setTitleColor(.black, for: .normal)
//        Found.addTarget(self, action: #selector(lostTableTapped), for: .touchUpInside)
        Found.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Found)
        
 
    }

    func setupConstraints() {
        
        //the parameter used in this section. Modify the scaler, the whole thing is adjusted.
        let theWidth = view.frame.width * 0.744;
        let theHeight = view.frame.height * 0.054;
        let titlefont = theHeight * 0.455;
        //lost
        NSLayoutConstraint.activate([
            Lost.widthAnchor.constraint(equalToConstant: theWidth),
            Lost.heightAnchor.constraint(equalToConstant: theHeight),
            Lost.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Lost.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
        ])
        
        //found
        NSLayoutConstraint.activate([
            Found.widthAnchor.constraint(equalToConstant: theWidth),
            Found.heightAnchor.constraint(equalToConstant: theHeight),
            Found.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Found.topAnchor.constraint(equalTo: Lost.bottomAnchor, constant: 30),
        ])
        
        //here I set up the fonts. It uses the height as a benchmark.
        
        Lost.titleLabel?.font = UIFont(name:"RoundedMplus1c-Medium", size: titlefont);
        Found.titleLabel?.font = UIFont(name:"RoundedMplus1c-Medium", size: titlefont);
    }
    
    @objc func lostTableTapped(){
        let FVC = FoundViewController();
        self.navigationController?.pushViewController(FVC, animated: true)
    }
    
    
}
