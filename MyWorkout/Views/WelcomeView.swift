//
//  WelcomeView.swift
//  MyWorkout
//
//  Created by Natthaporn Wimonanupong on 10/9/2564 BE.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    @State private var showFistory = false
    
    var body: some View {
        VStack {
            HeaderView(selectedTab:$selectedTab, titleText: NSLocalizedString("Welcome", comment: "greeting"))
            Spacer()
            
            VStack{
                HStack(alignment: .bottom){
                    VStack(alignment: .leading){
                        Text(NSLocalizedString("Get fit", comment: "invitation to exercise"))
                            .font(.largeTitle)
                        Text(NSLocalizedString("with high intensity interval training", comment: "subtitle invitation to exercise"))
                    }
                    Image("step-up")
                        .resizedToFill(width:240, height:240)
                        .clipShape(Circle())
                }
            }
            Button(action: { selectedTab = 0 }){
                Text(NSLocalizedString("Get Started", comment: "invitation"))
                Image(systemName: "arrow.right.circle")
            }
            .font(.title2)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth : 2))
            
            
            Spacer()
            Button(NSLocalizedString("History", comment: "view user activity")){ showFistory.toggle() }
                .padding(.bottom)
                .sheet(isPresented: $showFistory){
                    HistoryView(showHistory: $showFistory)
                }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
    }
}
