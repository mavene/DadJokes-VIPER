//
//  JokesPresenter.swift
//  DadJokes-VIPER
//
//  Created by Dian Maisara on 30/10/26.
//

class JokesPresenter: JokesPresenterProtocol, JokesInteractorOutputProtocol {

    weak var view: JokesViewProtocol?
    private let interactor: JokesInteractorInputProtocol
    // MARK: No need to navigate so no router protocols..

    private var currentJoke: Joke? // only dislaying one joke at all times
    
    init(view: JokesViewProtocol, interactor: JokesInteractorInputProtocol) {
        self.view = view
        self.interactor = interactor
        // MARK: No need to wire up to router
    }

    // MARK: View -> Presenter
    func viewDidLoad() {
        interactor.loadFirstJoke()
    }

    func didTapShowPunchline() {
        // make sure we got the right joke
        guard let joke = currentJoke else { return }
        // show the joke
        view?.showJoke(setup: joke.setup, punchline: joke.punchline, isPunchlineVisible: true)
    }

    func didTapNext() {
        // move onto the next one
        interactor.loadNextJoke()
    }

    // MARK: Interactor -> Presenter
    func didLoadJoke(_ joke: Joke, isLast: Bool) {
        currentJoke = joke
        // the punchline always starts hidden
        view?.showJoke(setup: joke.setup, punchline: joke.punchline, isPunchlineVisible: false)
    }
}
