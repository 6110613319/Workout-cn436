//
//  Exercise.swift
//  MyWorkout
//
//  Created by Natthaporn Wimonanupong on 10/9/2564 BE.
//

import Foundation

struct Exercise{
    let exerciseNames: String
    let videoNames: String
    
    enum ExerciseEnum: CustomStringConvertible{
        case warmUp
        case squat
        case stepUp
        case burpee
        case sunSalute
        case crunch
        case armWorkout
        
        var description: String{
            switch self {
            case .warmUp:
                return NSLocalizedString("Warm Up", comment: "exercise")
                
            case .squat:
                return NSLocalizedString("Squat", comment: "exercise")
            
            case .stepUp:
                return NSLocalizedString("Step Up", comment: "exercise")
            
            case .burpee:
                return NSLocalizedString("Burpee", comment: "exercise")
            
            case .sunSalute:
                return NSLocalizedString("Sun Salute", comment: "exercise")
                
            case .crunch:
                return NSLocalizedString("Crunch", comment: "exercise")
                
            case .armWorkout:
                return NSLocalizedString("Arm Workout", comment: "exercise")
            }
        }
    }
}

// แยกมาเขียนจะได้ไม่ลก
extension Exercise{
    static let exercises = [
        Exercise(exerciseNames: String(describing: ExerciseEnum.warmUp), videoNames: "warm-up"),
        Exercise(exerciseNames: String(describing: ExerciseEnum.squat), videoNames: "squat"),
        Exercise(exerciseNames: String(describing: ExerciseEnum.stepUp), videoNames: "step-up"),
        Exercise(exerciseNames: String(describing: ExerciseEnum.burpee), videoNames: "burpee"),
        Exercise(exerciseNames: String(describing: ExerciseEnum.sunSalute), videoNames: "sun-salute"),
        Exercise(exerciseNames: String(describing: ExerciseEnum.crunch), videoNames: "crunch"),
        Exercise(exerciseNames: String(describing: ExerciseEnum.armWorkout), videoNames: "arm-workout")
    ]
}
