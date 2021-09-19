//
//  HistoryStoreDevData.swift
//  MyWorkout
//
//  Created by Natthaporn Wimonanupong on 10/9/2564 BE.
//

import Foundation

extension HistoryStore{
    // mutating เพราะว่า HistoryStore เป็น struct  แต่เอาออกเพราะว่า มันเปลี่ยนเป็น class แล้ว
    func createDevDate(){
        exerciseDays = [
            ExerciseDay(date: Date().addingTimeInterval(-86400), exercises:[
                Exercise.exercises[0].exerciseNames,
                Exercise.exercises[1].exerciseNames,
                Exercise.exercises[2].exerciseNames
            ]),
            ExerciseDay(date: Date().addingTimeInterval(-86400 * 2), exercises:[
                Exercise.exercises[0].exerciseNames,
                Exercise.exercises[1].exerciseNames
            ])
        ]
    }
}
