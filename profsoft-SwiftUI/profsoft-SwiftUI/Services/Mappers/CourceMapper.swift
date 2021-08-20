//
//  CourceMapper.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 18.08.2021.
//

import Foundation

final class CourceMapper: BaseModelMapper<ServerCource, Cource> {
	
	override func toLocal(serverEntity: ServerCource) -> Cource {
		
		Cource(
			certificateNumber: serverEntity.certificateNumber ?? "",
			cource: serverEntity.cource ?? "",
			formEducation: serverEntity.formEducation ?? "",
			period: serverEntity.period ?? "",
			description: serverEntity.description ?? "",
			teacher: serverEntity.teacher ?? ""
		)

	}
}
