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
}
