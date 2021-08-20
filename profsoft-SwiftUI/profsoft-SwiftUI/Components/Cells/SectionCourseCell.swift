//
//  SectionCourceCell.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import SwiftUI

struct SectionCourseCell: View {
	
	@State private(set) var title: String
	@State private(set) var description: String
	
    var body: some View {
        content
    }
	
}

extension SectionCourseCell {
	
	var content: some View {
		VStack(spacing: 0) {
			BaseText(text: title, foregroundColor: .gray, fontSize: 15, alignment: .leading)
				.padding(.top, 5)
				.padding(.bottom, 5)
			
			BaseText(text: description, foregroundColor: .black, fontSize: 15, alignment: .leading)
				.padding(.bottom, 5)
		}
	}
	
}

struct SectionCourseCell_Previews: PreviewProvider {
    static var previews: some View {
		SectionCourseCell(title: "Напралвение подготовки:", description: "Design")
    }
}
