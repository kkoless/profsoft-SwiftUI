//
//  BaseTextField.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI

struct BaseTextField: View {
	
	let placeholder: String
	@Binding var text: String
	//let onEditingChanged: (Bool) -> Void
	//let onCommit: () -> Void
	
	init(placeholder: String,
		 text: Binding<String>,
		 onEditingChanged: @escaping (Bool) -> Void = { _ in },
		 onCommit: @escaping () -> Void = {}) {
		self.placeholder = placeholder
		self._text = text
		//self.onEditingChanged = onEditingChanged
		//self.onCommit = onCommit
	}
	
	var body: some View {
		content
	}
}


extension BaseTextField {
	
	var content: some View {
		TextField(placeholder,
					text: $text)
			.padding(.horizontal)
			.frame(height: 50)
			.frame(maxWidth: .infinity)
			.background(Color.white)
			.cornerRadius(25)
			.overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 2))
	}
	
}

struct BaseTextField_Previews: PreviewProvider {
	static var previews: some View {
		BaseTextField(placeholder: "Email", text: .constant(""))
	}
}

