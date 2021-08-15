//
//  LoginForm.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI

struct LoginForm: View {
	
	private let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
	
	private let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$")
	
	
	@State private var email: String = ""
	@State private var password: String = ""
	@State private var isSecured: Bool = true
	
	var body: some View {
		content
	}
}

extension LoginForm {
	
	var content: some View {
		VStack(spacing: 0) {
			
			if !emailPredicate.evaluate(with: email) && !email.isEmpty {
				emailLabelError
			}
			
			emailTextField
			
			passwordTextField
			
			if !passwordPredicate.evaluate(with: password) && !password.isEmpty {
				passwordLabelError
			}
		}
	}
	
	
	var emailLabelError: some View {
		HStack {
			Text("Неверная форма ввода")
				.font(.system(size: 11, weight: .regular))
				.foregroundColor(.red)
				.padding(.bottom, 7)
				.padding(.horizontal, 26)
			
			Spacer()
		}
	}
	
	var emailTextField: some View {
		VStack {
			
			BaseTextField(placeholder: "Email", text: $email)
			.padding(.bottom, 15)
		}
		
	}
	
	
	var passwordLabelError: some View {
		HStack {
			Text("Пароль должен быть не менее 6 символов")
				.font(.system(size: 11, weight: .regular))
				.foregroundColor(.red)
				.padding(.top, 7)
				.padding(.horizontal, 26)
			
			Spacer()
		}
	}
	
	var passwordTextField: some View {
		PasswordTextField(password: $password, isSecured: $isSecured)
	}
	
}

extension LoginForm {
	
	
	
}


struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
		LoginForm()
    }
}
