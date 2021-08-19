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
	let aligment: Alignment
	let underline: Bool?
	
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
			.frame(maxWidth: .infinity, alignment: aligment)
	}
	
}

struct BaseText_Previews: PreviewProvider {
	static var previews: some View {
		BaseText(text: "Забыли пароль?", foregroundColor: .gray, fontSize: 16, aligment: .leading, underline: nil)
	}
}
