//
//  ProfileScreenViewModel.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import Foundation
import Combine

final class ProfileScreenViewModel: ObservableObject {

	@Published private(set) var screenState: ScreenState = .loaded

	private var productMethodState: MethodState = .success
	private var cancellable = Set<AnyCancellable>()
}

extension ProfileScreenViewModel {

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
