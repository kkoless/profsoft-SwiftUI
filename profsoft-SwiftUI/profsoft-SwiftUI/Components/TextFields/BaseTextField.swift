//
//  BaseTextField.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI

struct BaseTextField: View {
	
	private let placeholder: String
	@Binding private var borderColor: Color
	@Binding private var foregroundColor: Color
	
	@Binding var text: String
	
	init(placeholder: String,
		 text: Binding<String>,
		 borderColor: Binding<Color>,
		 foregroundColor: Binding<Color>,
		 onEditingChanged: @escaping (Bool) -> Void = { _ in },
		 onCommit: @escaping () -> Void = {}) {
		self.placeholder = placeholder
		self._text = text
		self._borderColor = borderColor
		self._foregroundColor = foregroundColor
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
			.foregroundColor(foregroundColor)
			.background(Color.white)
			.cornerRadius(25)
			.overlay(RoundedRectangle(cornerRadius: 25).stroke(borderColor, lineWidth: 2))
	}
	
}

struct BaseTextField_Previews: PreviewProvider {
	static var previews: some View {
		BaseTextField(placeholder: "Email", text: .constant("Kirill@gmail.com"), borderColor: .constant(.red), foregroundColor: .constant(.red))
	}
}

