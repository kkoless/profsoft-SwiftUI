//
//  LoginForm.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI

struct LoginForm: View {
	
	@Binding private(set) var email: String
	@Binding private(set) var password: String
	
	var body: some View {
		content
	}
	
}

extension LoginForm {
	
	var content: some View {
		VStack(spacing: 0) {
			
			emailTextField
				.padding(.bottom, 15)
			
			passwordTextField
		}
	}
	
	var emailTextField: some View {
		EmailTextField(email: $email)
	}
	
	var passwordTextField: some View {
		PasswordTextField(password: $password)
	}
	
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
		LoginForm(email: .constant("pro@gmail.com"), password: .constant("qwerty1"))
    }
}
