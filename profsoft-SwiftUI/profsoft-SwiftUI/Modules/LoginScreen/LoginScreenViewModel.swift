//
//  LoginScreenViewModel.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import Foundation
import Combine

final class LoginScreenViewModel: ObservableObject {

	@Published private(set) var screenState: ScreenState = .loaded

	private var authMethodState: MethodState = .success
	
	private var cancellable = Set<AnyCancellable>() // DisposeBag
}

extension LoginScreenViewModel {

	enum ScreenState {
		case processing // экран грузится
		case loaded // экран загрузился
		case error(ErrorState) // ошибка
	}

	enum ErrorState {
		case global
		case parsing
	}

	enum MethodState {
		case error
		case success
	}
}
