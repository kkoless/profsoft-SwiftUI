//
//  LoginForm.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI

struct LoginForm: View {
	
	@State private var email: String = ""
	@State private var password: String = ""
	@State private var secured: Bool = true
	
	var body: some View {
		content
	}
}

extension LoginForm {
	
	var content: some View {
		VStack {
			emailTextField
			passwordTextField
		}
		//.padding(.horizontal, 16)
	}
	
	var emailTextField: some View {
		BaseTextField(placeholder: "Email", text: $email)
			.padding(.bottom, 15)
	}
	
	var passwordTextField: some View {
		PasswordTextField()
	}
}


struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}
