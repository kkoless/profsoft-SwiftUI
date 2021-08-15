//
//  StartScreenView.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 12.08.2021.
//

import SwiftUI

struct StartScreenView: View {
	
	@ObservedObject private var viewModel: StartScreenViewModel
	
	@State private var link: AppStep? = nil
	
	init(viewModel: StartScreenViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		content
			.navigate(using: $link, flow: .onboarding)
	}
		
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
			companyLogo
				.padding(.horizontal, 78)
				.padding(.bottom, 223)
			enterButton
				.padding(.horizontal, 16)
				.padding(.bottom, 15)
			skipButton
				.padding(.horizontal, 16)
				.padding(.bottom, 20)
		}
	}
	
	var companyLogo: some View {
		CompanyLogo()
	}

	var enterButton: some View {
		BaseButton(foregroundColor: .white, backgroundColor: .black, borderColor: .black, buttonLabel: "Вход", step: .start) {
			link = .login
		}
	}
	
	var skipButton: some View {
		BaseButton(foregroundColor: .black, backgroundColor: .white, borderColor: .black, buttonLabel: "Продолжить без регистрации", step: .start) {

		}
	}

}

struct StartScreenView_Previews: PreviewProvider {
	static var previews: some View {
		StartScreenView(viewModel: StartScreenViewModel())
	}
}


