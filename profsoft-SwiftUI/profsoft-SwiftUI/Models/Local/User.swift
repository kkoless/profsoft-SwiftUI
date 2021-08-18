//
//  User.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

struct User {
	let firstName: String
	let lastName: String
	let patronymic: String
	let email: String
	let cources: [Cource]
	
	static func emptyObj() -> User {
		User(firstName: "", lastName: "", patronymic: "", email: "", cources: [])
	}
}

struct Cource {
	let certificateNumber: String
	let cource: String
	let formEducation: String
	let period: String
	let description: String
	let teacher: String
//  let certificate: Image
	
	static func emptyObj() -> Cource {
		Cource(certificateNumber: "", cource: "", formEducation: "", period: "", description: "", teacher: "")
	}
}
