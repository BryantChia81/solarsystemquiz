//
//  QuestionStruct.swift
//  
//
//  Created by itss on 26/11/19.
//

import Foundation


enum OptionChoices{
    case one
    case two
    case three
    case four
}



struct Question {
    var questionStatement : String
    var firstChoice : String
    var secondChoice : String
    var thirdChoice : String
    var fourthChoice : String
    var correctChoice : OptionChoices
    var answeredCorrectly: Bool
}
