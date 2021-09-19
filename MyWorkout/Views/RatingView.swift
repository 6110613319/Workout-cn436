//
//  RatingView.swift
//  MyWorkout
//
//  Created by Natthaporn Wimonanupong on 10/9/2564 BE.
//

import SwiftUI

struct RatingView: View {
    let exerciseIndex: Int
    @AppStorage("ratings") private var ratings =  String(repeating: "0", count: Exercise.exercises.count)
    @State private var rating = 0  //rating หน้าไหน ใช้คู่กับ exerciseIndex
    
    let maximumRating = 5
    
    let onColor = Color.red
    let offColor = Color.gray
    
    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(index > rating ? offColor :onColor)
                    .onTapGesture {
                        rating = index
                        updateRating(index: index)
                    }
                    .onAppear{ // ครั้งแรกที่แสดงจะให้ไปอ่านค่าratingเก่าจากไฟลืมา
                        let index = ratings.index(
                            ratings.startIndex, offsetBy: exerciseIndex
                        )
                        let character = ratings[index]
                        rating = character.wholeNumberValue ?? 0
                    }
            }.font(.largeTitle)
        }
    }
    // rating = "0000"
    private func updateRating(index: Int){
        rating = index
        // สัมพันกับ line 12 , get index and upadte value
        let index = ratings.index(
            ratings.startIndex, offsetBy: exerciseIndex
        )
        ratings.replaceSubrange(index...index, with: String(rating))
    }
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(exerciseIndex: 1)
            .previewLayout(.sizeThatFits)
    }
}
