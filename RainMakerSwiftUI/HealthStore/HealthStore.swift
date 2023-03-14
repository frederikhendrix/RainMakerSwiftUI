//
//  HealthStore.swift
//  RainMakerSwiftUI
//
//  Created by Mark on 14/03/2023.
//

import Foundation
import HealthKit
import SwiftUI
class HealthStore {
    var healthStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
    @AppStorage("gender") var gender: String?
    init() {
        //check if health data is available
        if HKHealthStore.isHealthDataAvailable(){
            healthStore = HKHealthStore()
        }
    }
    func calculateHeight(completion: @escaping (HKStatisticsCollection?) -> Void){
        //We are only interested in the amount of steps the user has taken
        let height = HKQuantityType.quantityType(forIdentifier:  HKQuantityTypeIdentifier.height)!
        
        // Start date is 7 days ago
        let startDate = Calendar.current.date(byAdding: .day,value: -7, to: Date())
        
        // Set time when day starts
        let anchorDate =  Date.init(timeIntervalSinceNow: -7*24*60*60)
        
        // Set interval to daily
        let daily =  DateComponents(day: 1)
        
        // Create query to health api
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        // Perform query
        query = HKStatisticsCollectionQuery(quantityType: height, quantitySamplePredicate: predicate, options: .mostRecent , anchorDate: anchorDate, intervalComponents: daily)
  
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
            if let healthStore = self.healthStore, let query = self.query {
                healthStore.execute(query)
            }
        
    }
    func calculateWeight(completion: @escaping (HKStatisticsCollection?) -> Void){
        //We are only interested in the amount of steps the user has taken
        let height = HKQuantityType.quantityType(forIdentifier:  HKQuantityTypeIdentifier.bodyMass)!
        
        // Start date is 7 days ago
        let startDate = Calendar.current.date(byAdding: .day,value: -7, to: Date())
        
        // Set time when day starts
        let anchorDate =  Date.init(timeIntervalSinceNow: -7*24*60*60)
        
        // Set interval to daily
        let daily =  DateComponents(day: 1)
        
        // Create query to health api
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        // Perform query
        query = HKStatisticsCollectionQuery(quantityType: height, quantitySamplePredicate: predicate, options: .mostRecent , anchorDate: anchorDate, intervalComponents: daily)
  
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
            if let healthStore = self.healthStore, let query = self.query {
                healthStore.execute(query)
            }
        
    }
    func getGender(){
        if(try! healthStore?.biologicalSex().biologicalSex == HKBiologicalSex.female){
            print("User is a female")
            self.gender = "female"
        }
        if(try! healthStore?.biologicalSex().biologicalSex == HKBiologicalSex.male){
           self.gender = "male"
       }
    }
    func requestAuthorization(completion: @escaping (Bool) -> Void){
        let gender = HKObjectType.characteristicType(forIdentifier: .biologicalSex)!
        let birthday = HKObjectType.characteristicType(forIdentifier: .dateOfBirth)!
        let height = HKObjectType.quantityType(forIdentifier: .height)!
        let weight = HKObjectType.quantityType(forIdentifier: .bodyMass)!
        
        
        guard let healthStore = self.healthStore else{ return completion(false) } // check if healthstore is accesible
        
        healthStore.requestAuthorization(toShare: [], read: [gender, birthday, height, weight]){ (succes, error) in
            completion(succes)
            // Request authorization for using health data
        }
    }
}
