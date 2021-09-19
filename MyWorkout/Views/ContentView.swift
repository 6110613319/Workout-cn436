//
//  ContentView.swift
//  MyWorkout
//
//  Created by Natthaporn Wimonanupong on 10/9/2564 BE.
//

import SwiftUI

struct ContentView: View {
    // จำหน้าล่าสุดที่เราเปิดเอาไว้ค่ามันมีค่า // ใช้SceneStorage เพราะ ipad เปืดหลายหน้าได้ มันสามารถเก็บของแต่ละsceneได้
    @SceneStorage("selectedTab") private var selectedTab = 9
    
    
    var body: some View {
        TabView(selection: $selectedTab){
            WelcomeView(selectedTab: $selectedTab)
                .tag(9)
            ForEach(0 ..< Exercise.exercises.count) { index in
                ExerciseView(selectedTab: $selectedTab, index: index)
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(HistoryStore())
        }
    }
}
