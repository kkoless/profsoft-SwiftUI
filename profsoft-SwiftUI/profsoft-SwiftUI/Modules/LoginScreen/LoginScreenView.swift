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
	
	@State private var link: AppStep? = nil
	
	@State private var showingAlert = false
	
	@State private var email: String = ""
	@State private var password: String = ""


	init(viewModel: LoginScreenViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		content
			.navigate(using: $link, flow: .general)
	}
		
}

private extension LoginScreenView {

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
		VStack {
			
			Group {
				Spacer()
				Spacer()
			}
			
			VStack {
				Group {
					Spacer()
					Spacer()
				}
				
				companyLogo
					.padding(.horizontal, 78)
				
				Group {
					Spacer()
					Spacer()
				}
				
				loginForm
					.padding(.horizontal, 16)
				
				Spacer()
				
			} // VStack 2
			
			VStack(spacing: 0) {
				
				forgotPasswordButton
					.padding(.bottom, 20)
					.padding(.horizontal, 16)
					.frame(alignment: .leading)
				enterButton
					.padding(.horizontal, 16)
					.padding(.bottom, 20)
				
			} // VStack 3
			
		} //VStack 1
		.onTapGesture(perform: hideKeyboard)
		
	}
	
	var companyLogo: some View {
		CompanyLogo()
	}

	var loginForm: some View {
		LoginForm(email: $email, password: $password)
	}

	
	var forgotPasswordButton: some View {
		Button(
			action: { showingAlert = true }) {
			BaseText(text: "Забыли пароль?", foregroundColor: .gray, fontSize: 16, alignment: .leading)
		}
		.alert(isPresented: $showingAlert) {
			Alert(title: Text("Забыли пароль?").bold(), message: Text("Напишите в поддержку academy@profsoft.pro"), dismissButton: .cancel(Text("Вернуться")))
}
	}
	
	var enterButton: some View {
		BaseButton(
			foregroundColor: .white,
			backgroundColor: !changeColorButton() ? .gray : .black,
			borderColor: !changeColorButton() ? .gray : .black,
			buttonLabel: "Вход"
		) {
			link = isLogin() ? .dashboard : .none
		}
	}
	
	func isLogin() -> Bool {
		let userPassword = Consts.UserCredentials.password
		let userEmail = Consts.UserCredentials.email
		
		let emailCheck = email == userEmail
		let passwordCheck = password == userPassword
		
		return emailCheck && passwordCheck ? true : false
	}
	
	func changeColorButton() -> Bool {
		let emailPredicate = Consts.DataValidate.emailPredicate
		let passwordPredicate = Consts.DataValidate.passwordPredicate
		
		let emailCheck = !emailPredicate.evaluate(with: email) || email.isEmpty
		let passwordCheck = !passwordPredicate.evaluate(with: password) || password.isEmpty
		
		return emailCheck || passwordCheck ? false : true
	}

}

struct LoginScreenView_Previews: PreviewProvider {
	static var previews: some View {
		LoginScreenView(viewModel: LoginScreenViewModel())
	}
}

