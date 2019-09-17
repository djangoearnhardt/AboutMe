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
        PersonController.shared.loadFromPersistentStore()
        if PersonController.shared.personArray[selectedIndex].isFavorite{
            heartButton.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Filled Heart"))
        } else {
            heartButton.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Empty Heart"))
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PersonController.shared.personArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carouCell", for: indexPath) as? PersonCollectionViewCell else {return UICollectionViewCell()}
        cell.layer.cornerRadius = 12
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
        PersonController.shared.personArray[selectedIndex].isFavorite.toggle()
        if PersonController.shared.personArray[selectedIndex].isFavorite{
             heartButton.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Filled Heart"))
        } else {
        heartButton.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Empty Heart"))
            PersonController.shared.saveToPersistentStore()
    }
    }
    /// Updates selectedIndex and then scrolls to it. Guards against overflowing too high or low.
    @IBAction func scrollButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 { // LEFT
            selectedIndex = selectedIndex > 0 ? selectedIndex : PersonController.shared.personArray.count
            selectedIndex -= 1
            let indexPath = IndexPath(row: selectedIndex, section: 0)
            carouselCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } else { // RIGHT
            selectedIndex = selectedIndex < PersonController.shared.personArray.count - 1 ? selectedIndex : -1
            selectedIndex += 1
            let indexPath = IndexPath(row: selectedIndex, section: 0)
            carouselCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        if PersonController.shared.personArray[selectedIndex].isFavorite{
            heartButton.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Filled Heart"))
        } else {
            heartButton.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Empty Heart"))
    }
}
}
