//
//  WardrobeView.swift
//  RainMakerSwiftUI
//
//  Created by Mark on 13/03/2023.
//

import SwiftUI
import HealthKit
struct WardrobeView: View {
    private var healthStore: HealthStore?
    @State private var selection = "Cold"
    @State private var height: Height?
    @State private var weight: Height?
    @AppStorage("selection") var pickSelection: String?
    @AppStorage("gender") var gender: String?
    let time = ["Cold","Hot"]
    init() {
        healthStore = HealthStore()
    }
    private func updateUIFromStats(_ statisticsCollection: HKStatisticsCollection, _ weight: HKStatisticsCollection){
        // Start date is 7 days ago
        let startDate = Calendar.current.date(byAdding: .day,value: -0, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate){
            (statistics, stop) in
            let count = statistics.sumQuantity()?.doubleValue(for: .meter())
            let height = Height(count: Int(count ?? 0 ), date: statistics.startDate)
            self.height = height
        }
        weight.enumerateStatistics(from: startDate, to: endDate){
            (statistics, stop) in
            let count = statistics.sumQuantity()?.doubleValue(for: .meter())
            let weight = Height(count: Int(count ?? 0 ), date: statistics.startDate)
            self.weight = weight
        }
    }
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "figure.walk")
                Text("Your height is:")
                Text("\(height?.count ?? 0) Cm")
            }
            HStack{
                Image(systemName: "figure.walk")
                Text("Your Weight is:")
                Text("\(height?.count ?? 0) Kg")
            }
            HStack{
                Image(systemName: "figure.walk")
                Text("Your gender is:")
                Text("\(gender ?? "")")
            }
            Picker("\(pickSelection ?? "")", selection: $selection) {
                ForEach(time, id: \.self) {
                    Text($0)
                }
            }.onChange(of: selection, perform: { _ in
                if(selection == "Hot"){
                    pickSelection = "Hot"
                }
                if(selection == "Cold"){
                    pickSelection = "Cold"
                }
                
            })
            .pickerStyle(.menu)
        }
        .onAppear{
            if let healthStore = healthStore {
                healthStore.requestAuthorization{ success in
                    if success == true {
                        healthStore.calculateHeight{
                            statisticsCollection in
                            healthStore.getGender()
                                healthStore.calculateWeight{
                                    weight in
                                    if let statisticsCollection = statisticsCollection, let weight = weight {
                                        // Update the UI
                                        updateUIFromStats(statisticsCollection, weight)
                                    }

                            }
                        }
                                }
                            }
                        }
                        
                    }
                }
            }

struct WardrobeView_Previews: PreviewProvider {
    static var previews: some View {
        WardrobeView()
    }
}
