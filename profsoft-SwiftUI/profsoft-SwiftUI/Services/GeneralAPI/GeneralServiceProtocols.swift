//
//  GeneralServiceProtocols.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 18.08.2021.
//

import Foundation
import Combine
import Moya

protocol UserReadable {
	func getUsers() -> AnyPublisher<User, MoyaError>
}

extension GeneralService: UserReadable {}
