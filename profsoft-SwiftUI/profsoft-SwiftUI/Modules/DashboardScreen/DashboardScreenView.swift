//
//  DashboardScreenView.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 16.08.2021.
//

import SwiftUI
import Combine

struct DashboardScreenView: View {
	
	@ObservedObject private var viewModel: DashboardScreenViewModel
	
	@State private var link: AppStep? = nil
	
	init(viewModel: DashboardScreenViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		content
			.navigate(using: $link, flow: .general)
	}
	
}

private extension DashboardScreenView {
	
	@ViewBuilder var content: some View {
		switch viewModel.screenState {
			case .processing:
				processingState
			case .loaded:
				loadedState
			case .error(let error):
				switch error {
					case .global:
						errorState
					case .parsing:
						errorState
				}
		}
	}
	
	var errorState: some View {
		VStack {
			Spacer()
		}
	}
	
	var processingState: some View {
		VStack {
			Spacer()
		}
	}
	
	var loadedState: some View {
		TabView {
			
			Text("home").navigationBarHidden(true)
				.tabItem {
					Image("home")
				}
			
			Text("search").navigationBarHidden(true)
				.tabItem {
					Image("search")
				}
			
			NavigationView {
				GeneralFlow.build(.profile)
			}
			.tabItem {
				
				Image("profile")
			}
			.navigationBarHidden(true)
			
		} // TabView
		
	}
	
}

struct DashboardScreenView_Previews: PreviewProvider {
	static var previews: some View {
		DashboardScreenView(viewModel: DashboardScreenViewModel())
	}
}
