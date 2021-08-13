//
//  profsoft_SwiftUIApp.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 12.08.2021.
//

import SwiftUI
import Combine

@main
struct profsoft_SwiftUIApp: App {
	
	@StateObject var viewModel = StartScreenViewModel()
	
	var body: some Scene {
		WindowGroup {
			NavigationView {
				StartScreenView(viewModel: viewModel)
			}
		}
	}
}
