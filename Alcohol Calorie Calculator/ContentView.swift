//
//  ContentView.swift
//  Alcohol Calorie Calculator
//
//  Created by Benjamin Tegge on 4/8/21.
//

import SwiftUI
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct ContentView: View {
    @State var calories: String = "0"
    @State var abv: String = "0"
    @State var volume: String = "0"
    @State var aType: Int
    @State var icon: String = "whiskey"
    @State var showAlert = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Alcohol Calorie Calculator")
                    .font(.title)
                    .foregroundColor(.green)
                Spacer()
                Button("+") {
                    showAlert = true
                }
                    .alert(isPresented: $showAlert){
                    Alert(title: Text("About"), message: Text("Developer: Ben Tegge"), dismissButton: .default(Text("OK")))
                }
                .font(.title)
                .foregroundColor(.black)
            }
            HStack{
                Spacer()
                Image("\(icon)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Spacer()
            }
            Picker(selection: $aType, label: Text("Choose Alcohol Type")) {
                Text("Liquor").tag(0)
                Text("Beer").tag(1)
                Text("Wine").tag(2)
            }
            .onChange(of: aType) {tag in
                switch tag {
                case 0:
                    icon = "whiskey"
                case 1:
                    icon = "beer"
                case 2:
                    icon = "wine"
                default:
                    icon = "null"
                }
            }
            HStack{
                Text("Volume (oz):")
                TextField("Volume (oz)", text: $volume)
                    .keyboardType(.numbersAndPunctuation)
            }
            HStack{
                Text("ABV %:")
                TextField("ABV %", text: $abv)
                    .keyboardType(.numbersAndPunctuation)
            }
            Spacer()
                .frame(height: 50)
            HStack{
                Spacer()
                Button(action: {
                    hideKeyboard()
                    if !abv.isEmpty && aType <= 2 && aType >= 0 && !volume.isEmpty {
                    self.calories = Calorie_Calculation(alcType: aType, abv: AbvCheck(abvText: abv), vol: VolumeCheck(volText: volume))
                    }
                }) {
                    Text("Calculate")
                }
                    .padding()
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                Spacer()
            }
            Spacer()
                .frame(height: 50)
            HStack{
                Spacer()
                Text("Calories = \(calories)")
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(calories: "", abv: "", volume: "", aType: 0)
    }
}
