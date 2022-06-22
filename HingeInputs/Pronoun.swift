//
//  Pronoun.swift
//  HingeInputs
//

import Foundation

struct Pronoun {
    let id: Int
    let isSingular: Bool
    let tense: Pronoun.Tense
    let title: String
}

extension Pronoun: Equatable {
    static func ==(lhs: Pronoun, rhs: Pronoun) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Pronoun {
    enum Tense {
        case subject
        case object
        case possessiveAdjective
        case possessivePronoun
        case reflexive
    }
}

extension Pronoun {
    static var testGroup1: [Pronoun] {
        [
            Pronoun(id: 0, isSingular: true, tense: .subject, title: "He"),
            Pronoun(id: 1, isSingular: true, tense: .subject, title: "She"),
            Pronoun(id: 2, isSingular: false, tense: .subject, title: "They"),
            Pronoun(id: 3, isSingular: true, tense: .object, title: "Him"),
            Pronoun(id: 4, isSingular: true, tense: .object, title: "Her"),
            Pronoun(id: 5, isSingular: false, tense: .object, title: "They"),
            Pronoun(id: 6, isSingular: true, tense: .possessiveAdjective, title: "His"),
            Pronoun(id: 7, isSingular: true, tense: .possessiveAdjective, title: "Her"),
            Pronoun(id: 8, isSingular: false, tense: .possessiveAdjective, title: "Their"),
            Pronoun(id: 9, isSingular: true, tense: .possessivePronoun, title: "His"),
            Pronoun(id: 10, isSingular: true, tense: .possessivePronoun, title: "Hers"),
            Pronoun(id: 11, isSingular: false, tense: .possessivePronoun, title: "Theirs"),
            Pronoun(id: 12, isSingular: true, tense: .reflexive, title: "Himself"),
            Pronoun(id: 13, isSingular: true, tense: .reflexive, title: "Herself"),
            Pronoun(id: 14, isSingular: false, tense: .reflexive, title: "Themselves")
        ]
    }
    
    static var testGroup2: [Pronoun] {
        [
            Pronoun(id: 0, isSingular: true, tense: .subject, title: "He"),
            Pronoun(id: 1, isSingular: true, tense: .subject, title: "She"),
            Pronoun(id: 2, isSingular: false, tense: .subject, title: "They")
        ]
    }
}
