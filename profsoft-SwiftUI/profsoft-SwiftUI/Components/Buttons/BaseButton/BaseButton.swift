//
//  EnterButtonView.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 13.08.2021.
//

import SwiftUI

struct BaseButton: View {
	
	private let foregroundColor: Color
	private let backgroundColor: Color
	private let borderColor: Color
	private let buttonLabel: String
	
	private let onTap: () -> Void
	
	init(foregroundColor: Color, backgroundColor: Color, borderColor: Color, buttonLabel: String, onTap: @escaping () -> Void = {}) {
		self.foregroundColor = foregroundColor
		self.backgroundColor = backgroundColor
		self.borderColor = borderColor
		self.buttonLabel = buttonLabel
		self.onTap = onTap
	}
	
    var body: some View {
		Button(action: onTap) {
			content
		}
    }
	
}


extension BaseButton {
	
	var content: some View {
		VStack {
			Text(buttonLabel)
				.font(.system(size: 16, weight: .semibold))
				.foregroundColor(foregroundColor)
		}
		.frame(maxWidth: .infinity)
		.frame(height: 50)
		.background(backgroundColor)
		.cornerRadius(25)
		.overlay(RoundedRectangle(cornerRadius: 25).stroke(borderColor, lineWidth: 2))
	}
	
}

struct BaseButton_Previews: PreviewProvider {
    static var previews: some View {
		BaseButton(foregroundColor: .white, backgroundColor: .black, borderColor: .black, buttonLabel: "Вход"){
			
		}
    }
}
