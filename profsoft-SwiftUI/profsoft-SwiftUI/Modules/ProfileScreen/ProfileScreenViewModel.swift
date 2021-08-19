//
//  ProfileScreenViewModel.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import Foundation
import Combine

final class ProfileScreenViewModel: ObservableObject {
	
	@Published private(set) var screenState: ScreenState = .processing

	private(set) var user = User.emptyObj()
	
	@Injected private var service: UserReadable
	private var userMethodState: MethodState = .success
	
	private var cancellable = Set<AnyCancellable>()
}

extension ProfileScreenViewModel {

	func getUsers() {

		userMethodState = .success

		DispatchQueue.main.async {
			self.screenState = .processing
		}

		service.getUsers()
			.catch { [weak self] error -> AnyPublisher<User, Never> in
				self?.userMethodState = .error
				return Just(User.emptyObj()).eraseToAnyPublisher()
			}
			.sink { [weak self] in
				guard let self = self else { return }

				if self.userMethodState != .error {
					self.user = $0

					DispatchQueue.main.async {
						self.screenState = .loaded
					}
					
				} else {
					DispatchQueue.main.async {
						self.screenState = .error
					}
				}
			}
			.store(in: &cancellable)
	}
	
}


extension ProfileScreenViewModel {

	enum ScreenState {
		case processing // экран грузится
		case loaded // экран загрузился
		case error // ошибка
	}
	enum MethodState {
		case error
		case success
	}
}
