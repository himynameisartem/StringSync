//
//  GuitarTuneView.swift
//  GuitarTune
//
//  Created by Артем Кудрявцев on 25.11.2023.
//

import SwiftUI

struct GuitarTuneView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
    }
}

struct GuitarTuneView_Previews: PreviewProvider {
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
