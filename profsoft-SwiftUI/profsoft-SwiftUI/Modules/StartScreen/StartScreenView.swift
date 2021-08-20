//
//  StartScreenView.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 12.08.2021.
//

import SwiftUI

struct StartScreenView: View {
	
	@ObservedObject private var viewModel: StartScreenViewModel
	
	@State private var link: AppStep? = nil
	
	@State private var endSplash: Bool = false
	
	init(viewModel: StartScreenViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		content
			.navigate(using: $link, flow: .general)
	}
		
}

private extension StartScreenView {

	@ViewBuilder var content: some View {
		switch viewModel.screenState {
			case .processing:
				processingState
			case .loaded:
				loadedState
			case .error(let error):
				switch error {
					case .global:
						errorState
					case .parsing:
						errorState
				}
		}
	}
	
	var errorState: some View {
		VStack {
			Spacer()
		}
	}

	var processingState: some View {
		VStack {
			Spacer()
		}
	}

	var loadedState: some View {
		ZStack {
			VStack(spacing: 0) {
				Group {
					Spacer()
					Spacer()
					Spacer()
				}
				companyLogo
					.padding(.horizontal, 78)
					.padding(.bottom, 223)
				
				Spacer()
				
				enterButton
					.padding(.horizontal, 16)
					.padding(.bottom, 15)
				skipButton
					.padding(.horizontal, 16)
					.padding(.bottom, 20)
				
			} // VStack
			.opacity(endSplash ? 1 : 0)
			
		} // ZStack
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
				endSplash.toggle()
			}
		}
		
	}
	
	var companyLogo: some View {
		CompanyLogo()
	}

	var enterButton: some View {
		BaseButton(foregroundColor: .white, backgroundColor: .black, borderColor: .black, buttonLabel: "Вход") {
			link = .login
		}
	}
	
	var skipButton: some View {
		BaseButton(foregroundColor: .black, backgroundColor: .white, borderColor: .black, buttonLabel: "Продолжить без регистрации") {
			link = .dashboard
		}
	}

}

struct StartScreenView_Previews: PreviewProvider {
	static var previews: some View {
		StartScreenView(viewModel: StartScreenViewModel())
	}
}


