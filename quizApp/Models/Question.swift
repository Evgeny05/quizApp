//
//  Question.swift
//  quizApp
//
//  Created by Евгений Дубиль on 02.04.2022.
//

enum ResponeType {
    case single
    case multiple
    case range
}

struct Question {
    let text: String
    let type: ResponeType
    let answers: [Answer]
}

extension Question {
    static func getQuestion() -> [Question] {
        return [
            Question(text: "Что ты любишь?",
                     type: .single,
                     answers: [
                        Answer(text: "Корм", type: .cat),
                        Answer(text: "Осел", type: .shrek),
                        Answer(text: "А я думала сова", type: .sova)
                     ]),
            Question(text: "Что ты любишь делать?",
                     type: .multiple,
                     answers: [
                        Answer(text: "Сидеть дома", type: .cat),
                        Answer(text: "Сидеть в болоте", type: .shrek),
                        Answer(text: "Гулять по парку", type: .sova)
                     ]),
            Question(text: "Нравится ли тебе снимать на камеру?",
                     type: .range,
                     answers: [
                        Answer(text: "Не лав", type: .cat),
                        Answer(text: "Не лав", type: .shrek),
                        Answer(text: "Лав", type: .sova)
                     ])
        ]
    }
}
