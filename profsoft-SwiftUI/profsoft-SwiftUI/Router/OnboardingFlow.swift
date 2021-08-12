//
//  StartFlow.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 12.08.2021.
//

import SwiftUI


struct OnboardingFlow {
	
	@ViewBuilder static func build(_ step: AppStep) -> some View {
		switch step {
			case . start: navigationToStartScreen()
			
		}
	}
	
	static func navigationToStartScreen() -> some View {
		StartScreenView()
	}

}
