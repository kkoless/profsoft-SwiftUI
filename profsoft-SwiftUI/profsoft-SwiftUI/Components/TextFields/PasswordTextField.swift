//
//  PasswordTextField.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI

struct PasswordTextField: View {
	
	private let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$")
	
	@Binding var password: String
	@State var isSecured: Bool = true
	
	var body: some View {
		
		VStack {
			
			HStack {
				ZStack(alignment: .trailing)  {
					if self.isSecured {
						SecureField("Пароль", text: $password)
							.padding(.horizontal)
							.frame(height: 50)
							.frame(maxWidth: .infinity)
							.foregroundColor(checkValid() ? .black : .red)
							.background(Color.white)
							.cornerRadius(25)
							.overlay(RoundedRectangle(cornerRadius: 25).stroke(checkValid() ? Color.black : Color.red, lineWidth: 2))
					}
					else {
						BaseTextField(placeholder: "Пароль", text: $password, borderColor: checkValid() ? .constant(.black): .constant(.red), foregroundColor: checkValid() ? .constant(.black): .constant(.red))
					}
					
					Button(action: { isSecured.toggle() }) {
						Image(
							checkValid()
								?
								(isSecured ? "eye-close" : "eye-open")
								:
								(isSecured ? "red-eye-close" : "red-eye-open")
						)
					}
					.alignmentGuide(.trailing) { _ in 40 }
					
				} //ZStake
				
			} // HStake
			
			if !checkValid() {
				passwordLabelError
			}
		}
		
	}
}

extension PasswordTextField {
	
	func checkValid() -> Bool {
		if !passwordPredicate.evaluate(with: password) && !password.isEmpty {
			return false
		}
		else { return true }
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
	
}


struct PasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
		PasswordTextField(password: .constant("123"))
    }
}
