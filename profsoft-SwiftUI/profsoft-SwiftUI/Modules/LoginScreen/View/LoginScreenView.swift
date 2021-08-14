//
//  LoginScreenView.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI

struct LoginScreenView: View {
	
//	@EnvironmentObject var settingModel: AppSetting
	
	@ObservedObject private var viewModel: LoginScreenViewModel
	
	@State private var link: AppStep? = nil
	
	init(viewModel: LoginScreenViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		content
	}
		
//		content
//			.navigate(using: $link, flow: .onboarding)
		
}

private extension LoginScreenView {

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
				.padding(.bottom, 192)
			loginForm
				.padding(.horizontal, 16)
				.padding(.bottom, 116)
			forgotPasswordLabel
				.padding(.bottom, 20)
				.padding(.horizontal, 16)
				.frame(alignment: .leading)
			enterButton
				.padding(.horizontal, 16)
				.padding(.bottom, 20)
		}
	}
	
	var companyLogo: some View {
		CompanyLogo()
	}

	var loginForm: some View {
		LoginForm()
	}
	
	var forgotPasswordLabel: some View {
		BaseText(text: "Забыли пароль?", foregroundColor: .gray, fontSize: 16, fontWeight: .semibold, aligment: .leading)
	}
	
	var enterButton: some View {
		BaseButton(foregroundColor: .white, backgroundColor: .gray, buttonLabel: "Вход", step: .start) {

		}
	}

}

struct LoginScreenView_Previews: PreviewProvider {
	static var previews: some View {
		LoginScreenView(viewModel: LoginScreenViewModel())
	}
}


extension View {
	
	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
