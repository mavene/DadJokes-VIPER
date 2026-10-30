//
//  JokesContracts.swift
//  DadJokes-VIPER
//
//  Created by Dian Maisara on 30/10/26.
//

// MARK: Protocol-delegates for View
protocol JokesViewProtocol: AnyObject {
    func showJoke(setup: String, punchline: String, isPunchlineVisible: Bool)
    func showMessage(title: String, message: String)
}

// MARK: Protocol-delegate for Presenter
protocol JokesPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didTapShowPunchline()
    func didTapNext()
}

// MARK: Protocol-delegate for Interactor (inputs)
protocol JokesInteractorInputProtocol: AnyObject {
    func loadFirstJoke()
    func loadNextJoke()
}

// MARK: Protocol-delegate for Interactor (outputs)
protocol JokesInteractorOutputProtocol: AnyObject {
    func didLoadJoke(_ joke: Joke, isLast: Bool)
}

// Answers to questions
// Who should know there are 10 jokes and what happens after the last one? Interactor
// Who decides punchline starts hidden? Presenter
// Who owns labels and the tap gesture? View
