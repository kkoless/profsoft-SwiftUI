//
//  CourceBlockCell.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import SwiftUI

struct CourceBlockCell: View {
	
	@State private var isShowMore: Bool = true
	
	@State private(set) var cource: Cource
	
    var body: some View {
       content
    }
	
}

extension CourceBlockCell {
	
	var content: some View {
		
		VStack(spacing: 0) {
			
			Group {
				
				SectionCourseCell(title: "Номер сертификата:", description: cource.certificateNumber)
					
				SectionCourseCell(title: "Направление подготовки:", description: cource.cource)
					
				SectionCourseCell(title: "Форма обучения:", description: cource.formEducation)
					
				SectionCourseCell(title: "Период обучения:", description: cource.period)
					.padding(.bottom, 3)
					
			} // Group 1
			
			if isShowMore {
				showMoreButtom
			} else {
				Group {
					SectionCourseCell(title: "Изучение:", description: cource.description)
						
					SectionCourseCell(title: "Преподаватель:", description: cource.teacher)
						.padding(.bottom, 5)
						
					Image("certificate")
						.resizable()
						.scaledToFill()
						.padding(.bottom, 10)
					
					BaseText(text: "ПОДЕЛИТЬСЯ", foregroundColor: .black, fontSize: 15, alignment: .leading, underline: true)
						.padding(.bottom, 10)
					
				} // Group 2
				
				showLessButtom
			}
			
		} // VStack
		
	}
	
	var showMoreButtom: some View {
		VStack(spacing: 0) {
			Button(action: { isShowMore.toggle() }, label: {
				Image("showMore")
					.frame(width: 24, height: 24, alignment: .center)
					.scaledToFill()
			})
			.padding(.bottom, 5)
			
			Image("separator")
				.resizable()
				.scaledToFit()
		}
		.padding(.bottom, 10)
	}
	
	var showLessButtom: some View {
		VStack(spacing: 0) {
			Button(action: { isShowMore.toggle() }, label: {
				Image("showLess")
					.frame(width: 24, height: 24, alignment: .center)
					.scaledToFill()
			})
			.padding(.bottom, 10)
			
			Image("separator")
				.resizable()
				.scaledToFit()
		}
		.padding(.bottom, 10)
	}
	
}

struct CourceBlockCell_Previews: PreviewProvider {
    static var previews: some View {
		CourceBlockCell(cource: Cource.emptyObj())
    }
}
