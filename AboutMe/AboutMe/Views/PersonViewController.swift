//
//  ViewController.swift
//  Carousel
//
//  Created by Jared Warren on 9/17/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Outlets
    
    @IBOutlet weak var heartButton: UIButton!
    
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    
    
    /// Tracks the currently centered cell index.
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Don't forget to disable user interaction (and set scrolling to horizontal either in code or storyboard).
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        carouselCollectionView.isUserInteractionEnabled = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Cells.colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carouCell", for: indexPath) as? PersonCollectionViewCell else {return UICollectionViewCell()}
        cell.layer.cornerRadius = 12
        cell.backgroundColor = Cells.colors[indexPath.row]
        let person = PersonController.shared.personArray[indexPath.row]
        cell.update(person: person)
        return cell
    }
    
    /// Changes cell size to take up most of the screen.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.9, height: collectionView.bounds.height * 0.9)
    }
    
    //MARK: - ACTIONS
    
    @IBAction func heartButtonTapped(_ sender: Any) {
        print(selectedIndex)
        //        PersonController.shared.modify(person: <#T##Person#>)
    }
    
    /// Updates selectedIndex and then scrolls to it. Guards against overflowing too high or low.
    @IBAction func scrollButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 { // LEFT
            selectedIndex = selectedIndex > 0 ? selectedIndex : Cells.colors.count
            selectedIndex -= 1
            let indexPath = IndexPath(row: selectedIndex, section: 0)
            carouselCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } else { // RIGHT
            selectedIndex = selectedIndex < Cells.colors.count - 1 ? selectedIndex : -1
            selectedIndex += 1
            let indexPath = IndexPath(row: selectedIndex, section: 0)
            carouselCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

/// Model and ModelController mixed into one.
struct Cells {
    static let colors: [UIColor] = [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)]
}
