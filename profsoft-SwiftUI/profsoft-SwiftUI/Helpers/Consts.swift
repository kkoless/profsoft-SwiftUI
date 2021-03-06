//
//  Consts.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import Foundation

enum Consts {
	
	enum API {
		static let baseUrl = URL(string: "https://www.json-generator.com")!
		static let authorizationHeader = "apiKey"
		static let xContentTypeName = "Content-type"
		static let xContentTypeValue = "application/json"
		static let authVerbose = true
		static let backendVerbose = true
	}
	
	enum UserCredentials {
		static let email = "pro@gmail.com"
		static let password = "qwerty1"
	}
	
	enum DataValidate {
		static let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
		static let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$")
	}
	
}
