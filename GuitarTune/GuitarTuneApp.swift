//
//  GuitarTuneApp.swift
//  GuitarTune
//
//  Created by Артем Кудрявцев on 02.11.2023.
//

import SwiftUI

@main
struct GuitarTuneApp: App {
    
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.unselectedColor)
    }
    
    var body: some Scene {
        WindowGroup {
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
}
