//
//  JokesRouter.swift
//  DadJokes-VIPER
//
//  Created by Dian Maisara on 30/10/26.
//

import UIKit

class JokesRouter {
    
    weak var viewController: UIViewController?
    
    // MARK: Create module and ties up everything together (view, presenter, interactor, router)
    // `static` = called on the type itself, `-> UIViewController` = what it hands back
    static func createJokesModule(jokes: [Joke]) -> UIViewController {
        let view = JokesViewController()
        let interactor = JokesInteractor(jokes: jokes)
        let presenter = JokesPresenter(view: view, interactor: interactor)
        let router = JokesRouter()
        
        view.presenter = presenter // strong ref
        interactor.output = presenter // weak ref
        router.viewController = view
        
        return view
    }
}
