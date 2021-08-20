//
//  DashboardScreenViewModel.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 16.08.2021.
//

import Foundation
import Combine

final class DashboardScreenViewModel: ObservableObject {

	@Published private(set) var screenState: ScreenState = .loaded

	private var dashboardMethodState: MethodState = .success
	
	private var cancellable = Set<AnyCancellable>()
}

extension DashboardScreenViewModel {

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
