//
//  ContentView.swift
//  GuitarTune
//
//  Created by Артем Кудрявцев on 02.11.2023.
//

import SwiftUI

struct MetronomeView: View {
    
    @State private var selectedBpm = "120"
    @State private var selectedTimeSignature = "4/4"
    @State private var isTick = false

    var bpm = Double()
    
    let bpmArray = (40...208).map { String($0) }
    let timeSignatureArray = ["2/4", "3/4", "4/4", "6/8", "9/8"]
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Picker("Bpm", selection: $selectedBpm) {
                        ForEach(bpmArray, id: \.self) { bpm in
                            Text(bpm).tag(bpm)
                                .foregroundColor(.unselectedColor)
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    Text("Bpm")
                        .foregroundColor(Color.accentColor)
                        .font(.system(size: 20))
                        .padding(.trailing, 50)
                    
                    Picker("TimeSignature", selection: $selectedTimeSignature) {
                        ForEach(timeSignatureArray, id: \.self) {timeSignature in
                            Text(timeSignature).tag(timeSignature)
                                .foregroundColor(.unselectedColor)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                
                ZStack {
                    Image("Metronome")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("MetronomeArrow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
//                        .rotationEffect(Angle(degrees: isTick ? 30 : -30))
                }
                .padding(.top, 80)
                .padding(.bottom, -80)
            }
        }
        .onAppear {
            let timeInterval = 60.0 / 120
            Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { _ in
                withAnimation(.linear(duration: 60.0 / 120).repeatForever(autoreverses: true)) {
                    self.isTick.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            MetronomeView()
                .tabItem {
                    Image(systemName: "metronome")
                    Text("Metronome")
                }
            GuitarTuneView()
                .tabItem {
                    Image(systemName: "guitars")
                    Text("Guitar Tune")
                }
            ChromaticTuneView()
                .tabItem {
                    Image(systemName: "waveform")
                    Text("Chromatic Tune")
                }
            ChordsView()
                .tabItem {
                    Image(systemName: "music.quarternote.3")
                    Text("Chords")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
    }
}



