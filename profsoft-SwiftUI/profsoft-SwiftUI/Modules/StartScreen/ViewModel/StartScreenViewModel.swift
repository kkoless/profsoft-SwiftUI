//
//  StartScreenViewModel.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 12.08.2021.
//

import Foundation
import Combine

struct User: Identifiable {
	let id = UUID().uuidString
	let name: String
}

final class StartScreenViewModel: ObservableObject {
	
	@Published var array: [User] = [] {
		didSet {
			print(array)
		}
	}
	
	@Published var login = ""
	
	init() {
		loadUser()
	}
}

private extension StartScreenViewModel {
	
	func loadUser() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
			guard let self = self else { return }
			self.array = [
				User(name: "Tom"),
				User(name: "Jon"),
				User(name: "Kevin")]
		}
	}
}
