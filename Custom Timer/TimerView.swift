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
        // continue 14:07
        ZStack {
            Circle()
                .stroke(lineWidth: 30)
                .foregroundStyle(timerObject.timerColor.opacity(0.4))
            Circle()
                .trim(from: 0.0, to: min(1 - timerObject.progress, 1.0))
                .stroke(timerObject.timerColor.gradient, style: StrokeStyle(
                    lineWidth: 30,
                    lineCap: .round,
                    lineJoin: .miter))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 2)
            Circle()
                .stroke(lineWidth: 15)
                .foregroundStyle(Color(uiColor: .systemBackground))
                .shadow(color: timerObject.timerColor.opacity(0.6), radius: 5)
                .frame(width: 40)
                .offset(x: -157)
                .rotationEffect(.degrees(90.0 - 360 * timerObject.progress))
            VStack {
                Text(displayTime(timerObject.length))
                    .monospacedDigit()
                    .font(.system(size: 25))
                
                Text(displayTime(timerObject.remainingTime))
                    .monospacedDigit()
                    .font(.system(size: 100))
            }
                .foregroundStyle(timerObject.timerColor)
                .bold()
                .contentTransition(.numericText())
        }
        .padding(40)
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
