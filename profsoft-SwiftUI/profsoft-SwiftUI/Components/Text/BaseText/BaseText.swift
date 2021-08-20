//
//  BaseText.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI

struct BaseText: View {
	
	private let text: String
	private let foregroundColor: Color
	private let fontSize: CGFloat
	private let alignment: Alignment
	private let underline: Bool?
	
	init(text: String, foregroundColor: Color, fontSize: CGFloat, alignment: Alignment, underline: Bool? = false) {
		self.text = text
		self.foregroundColor = foregroundColor
		self.fontSize = fontSize
		self.alignment = alignment
		self.underline = underline
	}
	
	var body: some View {
		content
	}
	
}


extension BaseText {
	
	var content: some View {
		Text(text)
			.underline(underline ?? false, color: Color.black)
			.foregroundColor(foregroundColor)
			.font(Font.custom("GolosText-Medium", size: fontSize))
			.frame(maxWidth: .infinity, alignment: alignment)
	}
	
}

struct BaseText_Previews: PreviewProvider {
	static var previews: some View {
		BaseText(text: "Забыли пароль?", foregroundColor: .gray, fontSize: 16, alignment: .leading)
	}
}
