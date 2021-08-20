//
//  ServerUser.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import Foundation

struct ServerUser: Decodable {
	let firstName: String?
	let lastName: String?
	let patronymic: String?
	let email: String?
	let cources: [ServerCource]?
	
	static func nullObj() -> ServerUser {
		ServerUser(firstName: nil, lastName: nil, patronymic: nil, email: nil, cources: nil)
	}
}

struct ServerCource: Decodable {
	let certificateNumber: String?
	let cource: String?
	let formEducation: String?
	let period: String?
	let description: String?
	let teacher: String?
//  let certificate: Image?
	
	static func nullObj() -> ServerCource {
		ServerCource(certificateNumber: nil, cource: nil, formEducation: nil, period: nil, description: nil, teacher: nil)
	}
}
