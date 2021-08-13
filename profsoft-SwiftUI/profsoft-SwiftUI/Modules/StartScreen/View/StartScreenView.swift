//
//  StartScreenView.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 12.08.2021.
//

import SwiftUI

struct StartScreenView: View {
	
//	@EnvironmentObject var settingModel: AppSetting
	
	@ObservedObject private var viewModel: StartScreenViewModel
	
	@State private var link: AppStep? = nil
	
	init(viewModel: StartScreenViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		content
	}
		
//		content
//			.navigate(using: $link, flow: .onboarding)
		
}

private extension StartScreenView {

	@ViewBuilder var content: some View {
		switch viewModel.screenState {
		case .processing:
			processingState
		case .loaded:
			loadedState
		case .error(let errorState):
			switch errorState {
			case .global:
				loadedState
			case .parsing:
				loadedState
			}
		}
	}

	var processingState: some View {
		VStack {
			Spacer()
		}
	}

	var loadedState: some View {
		VStack(spacing: 0) {
			Spacer()
			enterButton
				.padding(.horizontal, 16)
				.padding(.bottom, 15)
			skipButton
				.padding(.horizontal, 16)
				.padding(.bottom, 20)
		}
	}

	var enterButton: some View {
		BaseButton(foregroundColor: .white, backgroundColor: .black, buttonLabel: "Вход", step: .start) {

		}
	}
	
	var skipButton: some View {
		BaseButton(foregroundColor: .black, backgroundColor: .white, buttonLabel: "Продолжить без регистрации", step: .start) {

		}
	}

}

struct StartScreenView_Previews: PreviewProvider {
	static var previews: some View {
		StartScreenView(viewModel: StartScreenViewModel())
	}
}


extension View {
	
	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
