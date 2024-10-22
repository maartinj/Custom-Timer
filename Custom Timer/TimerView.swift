//
//  TimerView.swift
//  Custom Timer
//
//  Created by Marcin Jędrzejak on 22/10/2024.
//

import SwiftUI

struct TimerView: View {
    let timerObject: TimerObject
    let controls: Bool
    
    var body: some View {
        Text(displayTime(timerObject.remainingTime))
            .monospacedDigit()
            .font(.system(size: 100))
            .foregroundStyle(timerObject.timerColor)
            .bold()
            .contentTransition(.numericText())
            .animation(.linear, value: timerObject.remainingTime)
        
        HStack {
            Button {
                timerObject.startTimer()
            } label: {
                Image(systemName: "play.fill")
            }
            .disabled(timerObject.playButtonDisabled)
            
            Button {
                timerObject.stopTimer()
            } label: {
                Image(systemName: "pause.fill")
            }
            .disabled(timerObject.pauseButtonDisabled)
            
            Button {
                timerObject.resetTimer()
            } label: {
                Image(systemName: "gobackward")
            }
            .disabled(timerObject.resetButtonDisabled)
        }
    }
    
    func displayTime(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%01d:%02d", minutes, seconds)
    }
}

#Preview {
    TimerView(timerObject: TimerObject(timerColor: .red, length: 20), controls: true)
}
