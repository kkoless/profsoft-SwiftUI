//
//  PasswordTextField.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI

struct PasswordTextField: View {
	
	private let passwordPredicate = Consts.DataValidate.passwordPredicate
	
	@Binding private(set) var password: String
	@State private var isSecured: Bool = true
	
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
						BaseTextField(placeholder: "Пароль", text: $password, borderColor: checkValid() ? .black : .red, foregroundColor: checkValid() ? .black : .red)
					}
					
					Button(action: { isSecured.toggle() }) {
						Image(
							checkValid()
								?
								(isSecured ? "eye-open" : "eye-close")
								:
								(isSecured ? "red-eye-open" : "red-eye-close")
						)
					}
					.alignmentGuide(.trailing) { _ in 40 }
					
				} //ZStake
				
			} // HStake
			
			if !checkValid() {
				passwordLabelError
			}
			else {
				emptyBlock
			}
			
		} // VStack
		
	}
}

extension PasswordTextField {
	
	func checkValid() -> Bool {
		return !passwordPredicate.evaluate(with: password) && !password.isEmpty ? false : true
	}
	
	var passwordLabelError: some View {
		HStack {
			Text("Пароль должен быть не менее 6 символов")
				.font(Font.custom("Golos", size: 11).weight(.regular))
				.foregroundColor(.red)
				.padding(.top, 7)
				.padding(.horizontal, 26)
			
			Spacer()
		}
	}
	
	var emptyBlock: some View {
		Text("")
			.padding(.top, 7)
			.padding(.horizontal, 26)
	}
	
}


struct PasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
		PasswordTextField(password: .constant("123"))
    }
}
