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
        //load data if there is any
        
        //if no data, initialize person array
        personArray = [
        Person(name: <#T##String#>, origin: <#T##String#>, favoriteMovie: <#T##String#>, favoriteSuperHero: <#T##String#>, isFavorite: <#T##Bool#>)]
    }

    func createPerson(name:String,origin:String,funFact:String, superHero: String, isFavorite: Bool){
        let newPerson = Person(name: name, origin: origin, funFact: funFact, favoriteMovie: favoriteMovie, isFavorite: isFavorite)
        personArray.append(newPerson)
        saveToPersistentStore()

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
