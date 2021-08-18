//
//  CourceBlockCell.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import SwiftUI

struct CourceBlockCell: View {
	
	@State var isShowMore: Bool = true
	@State var cource: Cource
	
    var body: some View {
       content
    }
}

extension CourceBlockCell {
	
	var content: some View {
		
		VStack(spacing: 0) {
			Group {
				CourseCell(title: "Номер сертификата:", description: cource.certificateNumber)
					
				CourseCell(title: "Направление подготовки:", description: cource.cource)
					
				CourseCell(title: "Форма обучения:", description: cource.formEducation)
					
				CourseCell(title: "Период обучения:", description: cource.period)
					.padding(.bottom, 3)
					
			}
			
			if isShowMore {
				showMoreButtom
			}
			
			else {
				Group {
					CourseCell(title: "Изучение:", description: cource.description)
						
					CourseCell(title: "Преподаватель:", description: cource.teacher)
						
					Image("certificate")
						.resizable()
						.scaledToFill()
						.padding(.bottom, 10)
					
					BaseText(text: "ПОДЕЛИТЬСЯ", foregroundColor: .black, fontSize: 15, aligment: .leading, underline: true)
						.padding(.bottom, 10)
					
				}
				
				showLessButtom
			}
			
		}
		
		
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
