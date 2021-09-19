//
//  HistoryView.swift
//  MyWorkout
//
//  Created by Natthaporn Wimonanupong on 10/9/2564 BE.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: HistoryStore
    @Binding var showHistory: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack{
                Form{
                    ForEach(history.exerciseDays) { day in
                        Section(header: Text(day.date.formatted(as: "MMM d"))){
                            ForEach(day.exercises, id: \.self){
                                exercise in Text(exercise)
                            }
                        }
                    }
                }
            }
            Button(action:{ showHistory.toggle() }){
                Image(systemName: "xmark.circle")
                    .font(.title)
                    .padding(.trailing)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
            .environmentObject(HistoryStore())
    }
}
