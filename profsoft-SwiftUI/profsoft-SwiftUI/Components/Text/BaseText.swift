//
//  BaseText.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 14.08.2021.
//

import SwiftUI

struct BaseText: View {
	
	let text: String
	let foregroundColor: Color
	let fontSize: CGFloat
	let fontWeight: Font.Weight
	let aligment: Alignment
	
	var body: some View {
		content
	}
}


extension BaseText {
	
	var content: some View {
		Text(text)
			.foregroundColor(foregroundColor)
			.font(.system(size: fontSize, weight: fontWeight))
			.frame(maxWidth: .infinity, alignment: aligment)
	}
	
}

struct BaseText_Previews: PreviewProvider {
	static var previews: some View {
		BaseText(text: "Забыли пароль?", foregroundColor: .gray, fontSize: 16, fontWeight: .semibold, aligment: .leading)
	}
}
