//
//  Bundle.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 18.08.2021.
//

import Foundation

extension Bundle {
	
	func json(by name: String) -> Data {
		guard let patch = path(forResource: name, ofType: "json")  else { return Data() }
		return try! Data(contentsOf: URL(fileURLWithPath: patch))
	}
}
