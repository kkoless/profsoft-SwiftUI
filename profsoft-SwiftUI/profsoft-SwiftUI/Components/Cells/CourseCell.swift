//
//  CourceCell.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import SwiftUI

struct CourseCell: View {
	
	@State var title: String
	@State var description: String
	
    var body: some View {
        content
    }
}

extension CourseCell {
	
	var content: some View {
		VStack(spacing: 0) {
			BaseText(text: title, foregroundColor: .gray, fontSize: 15, aligment: .leading, underline: false)
				.padding(.top, 5)
				.padding(.bottom, 5)
			
			BaseText(text: description, foregroundColor: .black, fontSize: 15, aligment: .leading, underline: false)
				.padding(.bottom, 5)
		}
	}
	
}

struct CourseCell_Previews: PreviewProvider {
    static var previews: some View {
		CourseCell(title: "Напралвение подготовки:", description: "Design")
    }
}
