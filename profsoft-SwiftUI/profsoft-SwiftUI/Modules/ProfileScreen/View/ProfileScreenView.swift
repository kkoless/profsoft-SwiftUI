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
		
		ScrollView {
			VStack(spacing: 0){
				headerCell
				
				Text("МОИ КУРСЫ")
					.foregroundColor(.black)
					.font(Font.custom("GolosText-DemiBold", size: 15))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal, 18)
					.padding(.top, 15)
					.padding(.bottom, 15)
				
				//ForEach cources
				
				CourceBlockCell()
					.padding(.horizontal, 18)
				
				CourceBlockCell()
					.padding(.horizontal, 18)
				
				Spacer()
			}
			
		}
		.ignoresSafeArea(.all, edges: .top)
		
	}
	
	
	
	var headerCell: some View {
		HeaderCell()
	}
	
}

struct ProfileScreenView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileScreenView(viewModel: ProfileScreenViewModel())
	}
}

