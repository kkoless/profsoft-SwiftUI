//
//  GeneralAPI.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import Foundation
import Moya


enum GeneralAPI {
	case getUsers
}

extension GeneralAPI: TargetType {
	var baseURL: URL {
		return Consts.API.baseUrl
	}
	
	var path: String {
		switch self {
			case .getUsers:
				return "/user"
		}
	}
	
	var method: Moya.Method {
		switch self {
			case .getUsers:
				return .get
		}
	}
	
	var sampleData: Data {
		switch self {
			case .getUsers:
				return Bundle.main.json(by: "user")
		}
	}
	
	var task: Task {
		switch self {
			case .getUsers:
				return .requestPlain
		}
	}
	
	var headers: [String : String]? {
		return nil
	}
}
