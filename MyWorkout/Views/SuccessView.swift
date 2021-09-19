//
//  SuccessView.swift
//  MyWorkout
//
//  Created by Natthaporn Wimonanupong on 10/9/2564 BE.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            VStack{
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(.purple)
                Text(NSLocalizedString("High Five!", comment: "success all exercise"))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text(NSLocalizedString("Good job completing all seven exercises!", comment: "message success"))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Text(NSLocalizedString("Remember tomorrow's another day.", comment: "message success"))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Text(NSLocalizedString("So eat well and get some rest", comment: "message success"))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
                VStack{
                    Spacer()
                    Button(NSLocalizedString("Continue", comment: "start again")){
                        presentationMode.wrappedValue.dismiss()
                        selectedTab = 9
                    }
                        .padding()
                }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3))
    }
}
