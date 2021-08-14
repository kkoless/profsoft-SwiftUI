//
//  PasswordTextField.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI

struct PasswordTextField: View {
	
	@State var password: String = ""
	@State private var secured: Bool = true
	
	var body: some View {
		
		HStack {
			
			ZStack(alignment: .trailing)  {
				if self.secured {
					SecureField("Пароль", text: $password)
						.padding(.horizontal)
						.frame(height: 50)
						.frame(maxWidth: .infinity)
						.background(Color.white)
						.cornerRadius(25)
						.overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 2))
				}
				else {
					BaseTextField(placeholder: "Пароль", text: $password)
				}
				
				Button(action: { self.secured.toggle() }) {
					Image(self.secured ? "eye-close" : "eye-open")
				}
				.alignmentGuide(.trailing) { _ in 40 }
				
			} //ZStake
			
		} // HStake
		
	}
}

struct PasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextField()
    }
}
