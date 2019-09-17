//
//  PersonController.swift
//  AboutMe
//
//  Created by Ian Hall on 9/17/19.
//  Copyright © 2019 DjangoEarnhardt. All rights reserved.
//

import Foundation


class PersonController {
    //singleton
    static let shared = PersonController()
    // source of truth
    var personArray:[Person] = []
    
    init() {

        loadFromPersistentStore()
        
        if self.personArray.isEmpty {
        personArray = [
        Person(name: "Tony Shell", origin: "I’m from Utah and I can bark like a dog.", favoriteMovie: "Deadpool", favoriteSuperHero: "Deadpool", isFavorite: false),
        Person(name: "Sam LoBue", origin: "Musician turned iOS Developer from Charlotte, NC", favoriteMovie: "The Prestige", favoriteSuperHero: "Gambit", isFavorite: false),
        Person(name: "Michael Killpack", origin: "I am from Murray, Utah. I like to play tennis and fish.", favoriteMovie: "Lonesome Dove", favoriteSuperHero: "Flash Gordon", isFavorite: false),
        Person(name: "Jeremy Ashby", origin: "I’m a learning UX designer looking to get some more experience of my own. I can lick my elbow.", favoriteMovie: "The Princess Bride", favoriteSuperHero: "Spiderman", isFavorite: false),
        Person(name: "Ian Hall", origin: "Hi I’m Ian and I like tacos and pizza. In my spare time I fight evil ninjas and make smoothies. So hit that heart button :wink:", favoriteMovie: "Star Wars Episode 3", favoriteSuperHero: "BATMAN", isFavorite: false),
        Person(name: "Daniel Peng", origin: "QA student from Pennsylvania", favoriteMovie: "Inception", favoriteSuperHero: "Iron Man", isFavorite: false)
        ]

        }
    }
    
    func modify(person: Person){
        if person.isFavorite {
            person.isFavorite = false
        } else {
            person.isFavorite = true
        }
        saveToPersistentStore()
    }
    
    //MARK: - Persistence
    
    func fileURL() -> URL {
        // this will get get you a list of URLS in the document directory(where we want to save) under the users domain
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // here were just gonna grab the first one on that list
        let documentDirectory = paths[0]
        //were gonna make a name for it specifying what kind of data it is (JSON)
        let filename = "aboutMe.json"
        //now we name the actual file here
        let fullURL = documentDirectory.appendingPathComponent(filename)
        return fullURL
    }
    
    //bam time for step 2 were gonna save to the document url
    // we need to call this whenever we manipulate data
    func saveToPersistentStore() {
        //first we power on the encoder
        let encoder = JSONEncoder()
        //now this can sometimes throw an error so we need to do a do try catch
        do{
            //this little guy puts it into computer lingo
            let data = try encoder.encode(personArray)
            //this guy writes it
            try data.write(to: fileURL())
        } catch{
            print("there was an error in \(#function) :\(error) : \(error.localizedDescription)")
        }
    }
    // put me in the initializar of the controller containing the singleton
    func loadFromPersistentStore() {
        //first we create our translator
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let peopleArray = try decoder.decode([Person].self, from: data)
            personArray = peopleArray
        } catch {
            print(print("there was an error in \(#function) :\(error) : \(error.localizedDescription)"))
        }
    }
    

}
