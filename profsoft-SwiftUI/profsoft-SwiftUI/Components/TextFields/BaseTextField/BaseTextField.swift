//
//  BaseTextField.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI

struct BaseTextField: View {
	
	private let placeholder: String
	private let borderColor: Color
	private let foregroundColor: Color
	
	@Binding private(set) var text: String
	
	init(placeholder: String, text: Binding<String>, borderColor: Color, foregroundColor: Color, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) {
		self.placeholder = placeholder
		self.borderColor = borderColor
		self.foregroundColor = foregroundColor
		self._text = text
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
			.font(Font.custom("GolosText-DemiBold", size: 16))
			.autocapitalization(.none)
			.frame(maxWidth: .infinity)
			.foregroundColor(foregroundColor)
			.background(Color.white)
			.cornerRadius(25)
			.overlay(RoundedRectangle(cornerRadius: 25).stroke(borderColor, lineWidth: 2))
	}
	
}

struct BaseTextField_Previews: PreviewProvider {
	static var previews: some View {
		BaseTextField(placeholder: "Email", text: .constant("Kirill@gmail.com"), borderColor: .red, foregroundColor: .red)
	}
}

