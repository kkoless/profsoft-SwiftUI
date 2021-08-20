//
//  UserMapper.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import Foundation

final class UserModelMapper: BaseModelMapper<ServerUser, User> {
	
	override func toLocal(serverEntity: ServerUser) -> User {
		
		User(
			firstName: serverEntity.firstName ?? "",
			lastName: serverEntity.lastName ?? "",
			patronymic: serverEntity.patronymic ?? "",
			email: serverEntity.email ?? "",
			cources: CourceMapper().toLocal(list: serverEntity.cources ?? [])
		)
		
	}
}
