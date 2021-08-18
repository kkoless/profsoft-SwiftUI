//
//  StartFlow.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 12.08.2021.
//

import SwiftUI


struct GeneralFlow {
	
	@ViewBuilder static func build(_ step: AppStep) -> some View {
		switch step {
			case .start: navigationToStartScreen()
			case .login: navigationToLoginScreen()
			case .dashboard: navigationToDashboardScreen()
            case .profile: navigationToProfileScreen()
		}
	}

}

private extension GeneralFlow {
    static func navigationToStartScreen() -> some View {
        StartScreenView(viewModel: StartScreenViewModel())
    }

    static func navigationToLoginScreen() -> some View {
        LoginScreenView(viewModel: LoginScreenViewModel()).navigationBarHidden(true)
    }

    static func navigationToDashboardScreen() -> some View {
        DashboardScreenView(viewModel: DashboardScreenViewModel()).navigationBarHidden(true)
    }

    static func navigationToProfileScreen() -> some View {
        ProfileScreenView(viewModel: ProfileScreenViewModel()).navigationBarHidden(true)
    }
}
