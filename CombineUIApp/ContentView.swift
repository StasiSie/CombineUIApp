//
//  ContentView.swift
//  CombineUIApp
//
//  Created by Игорь Богданов on 11.08.2022.
//

import SwiftUI

struct ContentView: View {
   
    @State private var currentValue: Float = 50
    @State private var showAlert = false
    @State private var targetValue = Int.random(in: 0...100)
    
    var body: some View {
        VStack {
            Spacer()
            Text("Передвиньте слайдер ближе к \(targetValue)")
            UIKitSliderView(currentValue: $currentValue, alpha: computeScore())
            Spacer()
            Button("Проверить меня", action: {showAlert = true})
                .alert("Ваш результат \(computeScore()) баллов", isPresented: $showAlert, actions: {})
            Button("Сгенерировать новое число", action: {targetValue = Int.random(in: 0...100)})
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(targetValue - lroundf(currentValue))
        return 100 - difference
    }
}

