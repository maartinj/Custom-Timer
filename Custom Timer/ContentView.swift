//
//  ContentView.swift
//  Custom Timer
//
//  Created by Marcin Jędrzejak on 18/10/2024.
//

import SwiftUI

struct ContentView: View {
    let timerObject = TimerObject(timerColor: .red, length: 10)
    let timerObject2 = TimerObject(timerColor: .green, length: 70)
    let timerObject3 = TimerObject(timerColor: .blue, length: 20)
    
    var body: some View {
        VStack {
            HStack {
                TimerView(timerObject: timerObject, controls: true)
                TimerView(timerObject: timerObject2, controls: true)
            }
            TimerView(timerObject: timerObject3, controls: false)
                .frame(width: 250)
        }
        .onAppear {
            Task {
                try await Task.sleep(for: .seconds(5))
                timerObject3.startTimer()
            }
        }
    }
}

#Preview {
    ContentView()
}
