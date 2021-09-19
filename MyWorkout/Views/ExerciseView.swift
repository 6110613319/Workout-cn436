//
//  ExerciseView.swift
//  MyWorkout
//
//  Created by Natthaporn Wimonanupong on 10/9/2564 BE.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @State var showHistory = false
    @State private var showSuccess =  false
    
    let index: Int
    @State private var timeDone = false
    @State private var showTimer = false
    
    @EnvironmentObject var history: HistoryStore
   // @State var pages: [Int] = []
    
    @AppStorage("pages") private var pages =  String(repeating: "9", count: Exercise.exercises.count)
    @State private var page = 0
    @State var count = 0
   
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab:$selectedTab, titleText: Exercise.exercises[index].exerciseNames)
                
                if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoNames, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(Exercise.exercises[index].videoNames).mp4")
                        .foregroundColor(.red)
                }
                
                
                HStack(spacing: 150){
                    Button(NSLocalizedString("Start", comment: "begin exercise")){ showTimer.toggle()}
                    Button(NSLocalizedString("Done", comment: "mark as finished")){
                        history.addDoneExercise(Exercise.exercises[index].exerciseNames)
                        timeDone = false // เราสามารถ restart ใหม่ได้
                        showTimer.toggle()
                        if(history.checkAllExercise() == 7){ // ถ้าทำครบทุกท่าแล้วให้ไปหน้า success
                            showSuccess.toggle()
                        }
                        else{
                           //print("---> page mook \(pages)")
                            // ถ้าหน้าไหนทำข้าม ก็ให้ย้อนไปทำ
                            let iPage = pages.index(pages.startIndex, offsetBy: selectedTab)
                            pages.replaceSubrange(iPage...iPage, with: String(selectedTab))
                            for indexP in pages {
                                if(indexP == "9"){
                                    selectedTab = count
                                    break
                                }
                                count += 1
                            }
                           // selectedTab += 1
                        }
                       // selectedTab = lastExercise ? 9 : selectedTab + 1
                    }
                    .disabled(!timeDone) // done กดไม่ได้ต้องรอฟมดเวลาก่อน
                    .sheet(isPresented: $showSuccess){
                        SuccessView(selectedTab: $selectedTab)
                    }
                }
                .font(.title3)
                .padding()
                
                if showTimer{
                    TimerView(timerDone: $timeDone) // ใส่ $ เพราะมัน blinding
                }
                
                Spacer()
                RatingView(exerciseIndex: index)
                    .padding()
                Button(NSLocalizedString("History", comment: "view user activity")){ showHistory.toggle() }
                    .padding(.bottom)
                    .sheet(isPresented: $showHistory){
                        HistoryView(showHistory:  $showHistory)
                    }
            }
        }
    }
   // เช็คว่าหน้าสุดท้ายหรือยัง ถ้าใช้จะกลับไปหน้า welcome
    var lastExercise: Bool{
        index + 1 == Exercise.exercises.count
    }
  
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // fix หน้าไว้ในเป็นหนเา 1
            ExerciseView(selectedTab: .constant(1), index: 1) 
                .environmentObject(HistoryStore())
        }
    }
}
