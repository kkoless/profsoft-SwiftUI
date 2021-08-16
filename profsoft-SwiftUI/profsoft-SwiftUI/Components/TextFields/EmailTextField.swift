//
//  EmailTextField.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 16.08.2021.
//

import SwiftUI

struct EmailTextField: View {
	
	private let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
	
	@Binding var email: String
	
	
	var body: some View {
		
		VStack {
			
			if !checkValid() {
				emailLabelError
			}
			
			BaseTextField(placeholder: "Email", text: $email, borderColor: checkValid() ? .constant(.black): .constant(.red), foregroundColor: checkValid() ? .constant(.black): .constant(.red))
		}
		
	}
}

extension EmailTextField {
	
	func checkValid() -> Bool {
		if !emailPredicate.evaluate(with: email) && !email.isEmpty {
			return false
		}
		else { return true }
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
	
}


struct EmailTextField_Previews: PreviewProvider {
	static var previews: some View {
		EmailTextField(email: .constant("Kirill@gma"))
	}
}
