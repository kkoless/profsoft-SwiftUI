//
//  GeneralService.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import Foundation
import CombineMoya
import Moya
import Combine

struct GeneralService {

	//let provider = MasterProvider<GeneralAPI>()
    private let testProvider = MasterProvider<GeneralAPI>(stubClosure: MasterProvider<GeneralAPI>.delayedStub(3), plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: [.formatRequestAscURL, .errorResponseBody, .verbose]))])
}

extension GeneralService {
	
	func getUsers() -> AnyPublisher<User, MoyaError> {
		
		return testProvider.requestPublisher(.getUsers)
			.filterSuccessfulStatusAndRedirectCodes()
			.map(ServerUser.self)
			.map { UserModelMapper().toLocal(serverEntity: $0) }
			.subscribe(on: DispatchQueue.global(qos: .userInitiated))
			.receive(on: RunLoop.main)
			.eraseToAnyPublisher()
	}

}

