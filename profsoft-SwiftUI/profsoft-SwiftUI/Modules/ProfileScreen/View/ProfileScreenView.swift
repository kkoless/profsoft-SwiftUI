//
//  ProfileScreenView.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import SwiftUI
import Combine

struct ProfileScreenView: View {
	
	@ObservedObject private var viewModel: ProfileScreenViewModel
	
	@State private var link: AppStep? = nil
	
	init(viewModel: ProfileScreenViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		content
			.navigate(using: $link, flow: .general)
	}
	
}

private extension ProfileScreenView {
	
	@ViewBuilder var content: some View {
		switch viewModel.screenState {
			case .processing:
				processingState
			case .loaded:
				loadedState
			case .error(let errorState):
				switch errorState {
					case .global:
						loadedState
					case .parsing:
						loadedState
				}
		}
	}
	
	var processingState: some View {
		VStack {
			Spacer()
		}
	}
	
	var loadedState: some View {
		
		VStack{
			headerCell
			Spacer()
		}
		.ignoresSafeArea(.all, edges: .top)
		
		
	}
	
	
	
	var headerCell: some View {
		HeaderCell()
	}
	
	func userImageTap() {
		
	}
	
}

struct ProfileScreenView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileScreenView(viewModel: ProfileScreenViewModel())
	}
}

