//
//  StartScreenViewModel.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 12.08.2021.
//

import Foundation
import Combine

final class StartScreenViewModel: ObservableObject {

	@Published private(set) var screenState: ScreenState = .loaded

	private var cancellable = Set<AnyCancellable>()
}

extension StartScreenViewModel {

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
