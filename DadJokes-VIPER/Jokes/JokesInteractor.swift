//
//  JokesInteractor.swift
//  DadJokes-VIPER
//
//  Created by Dian Maisara on 30/10/26.
//

class JokesInteractor: JokesInteractorInputProtocol {

    // MARK: Holds the output protocol weakly
    weak var output: JokesInteractorOutputProtocol?

    private let jokes: [Joke]
    private var currentIndex = 0 // keeps track of the current joke to display

    init(jokes: [Joke]) {
        self.jokes = jokes
    }

    func loadFirstJoke() {
        // just shows it
        sendCurrentJoke()
    }

    func loadNextJoke() {
        // cycle back to first joke after the last one
        currentIndex = (currentIndex + 1) % jokes.count
        sendCurrentJoke()
    }

    private func sendCurrentJoke() {
        // make sure jokes is not empty
        guard !jokes.isEmpty else { return }
        // load the next joke given current index and cycle flag
        output?.didLoadJoke(jokes[currentIndex], isLast: currentIndex == jokes.count - 1)
    }
}
