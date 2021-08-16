//
//  LoginScreenView.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI
import Combine

struct LoginScreenView: View {
	
	@ObservedObject private var viewModel: LoginScreenViewModel
	
	@StateObject private var keyboardHandler = KeyboardHandler()
	
	@State private var link: AppStep? = nil
	@State private var showingAlert = false
	
	init(viewModel: LoginScreenViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		content
	}
		
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
		VStack{
			Spacer()
			
			VStack(spacing: 0) {
				companyLogo
					.padding(.horizontal, 78)
					//.padding(.top, 217)
					.padding(.bottom, 193)
				
				loginForm
					.padding(.horizontal, 16)
					.padding(.bottom, 116)
				forgotPasswordButton
					.padding(.bottom, 20)
					.padding(.horizontal, 16)
					.frame(alignment: .leading)
				enterButton
					.padding(.horizontal, 16)
					.padding(.bottom, 20)
			}
		}
		//.padding(.bottom, keyboardHandler.keyboardHeight - 100)
		.animation(.spring())
		
	}
	
	var companyLogo: some View {
		CompanyLogo()
	}

	var loginForm: some View {
		LoginForm()
	}
	
	var forgotPasswordButton: some View {
		Button(
			action: { showingAlert = true }) {
			BaseText(text: "Забыли пароль?", foregroundColor: .gray, fontSize: 16, fontWeight: .semibold, aligment: .leading)
		}
		.alert(isPresented: $showingAlert) {
			Alert(title: Text("Забыли пароль?").bold(), message: Text("Напишите в поддержку academy@profsoft.pro"), dismissButton: .cancel(Text("Вернуться")))
}
	}
	
	var enterButton: some View {
		BaseButton(foregroundColor: .white, backgroundColor: .gray, borderColor: .gray, buttonLabel: "Вход", step: .start) {

		}
	}

}

struct LoginScreenView_Previews: PreviewProvider {
	static var previews: some View {
		LoginScreenView(viewModel: LoginScreenViewModel())
	}
}


//extension View {
//	
//	func hideKeyboard() {
//		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//	}
//}
