//
//  MasterProvider.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import Foundation
import Alamofire
import Moya

final class MasterProvider<P>: MoyaProvider<P> where P: TargetType {

	convenience init() {
		let endpointClosure = { (target: P) -> Endpoint in
			let defaultEndpointMapping = MoyaProvider
				.defaultEndpointMapping(for: target)

			return defaultEndpointMapping
		}
		let logger = NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: [.formatRequestAscURL, .errorResponseBody, .verbose]))

		self.init(endpointClosure: endpointClosure,
				  plugins: [logger])
	}
}
