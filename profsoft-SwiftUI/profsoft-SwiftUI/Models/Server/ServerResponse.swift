//
//  ServerResponse.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import Foundation

struct ServerArrayResponse<T: Decodable>: Decodable {
	let cources: [T]?
}

struct ServerResponse<T: Decodable>: Decodable {
	let cources: T

	enum CodingKeys: String, CodingKey {
		case cources
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)

		self.cources = try values.decode(T.self, forKey: .cources)
	}

}
