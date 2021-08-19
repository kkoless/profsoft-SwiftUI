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
    @State private var viewDidAppear = false
	
	init(viewModel: ProfileScreenViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		content
			.navigate(using: $link, flow: .general)
			.onAppear {
                guard !viewDidAppear else { return }
				viewModel.getUsers()
                viewDidAppear.toggle()
			}
	}
	
}

private extension ProfileScreenView {
	
	@ViewBuilder var content: some View {
		switch viewModel.screenState {
			case .processing:
				processingState
			case .loaded:
				loadedState
			case .error:
				errorState
		}
	}
	
	var processingState: some View {
		VStack {
			Spacer()
		}
	}
	
	var errorState: some View {
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
				
				Group {
					ForEach(viewModel.user.cources) { cource in
						CourceBlockCell(cource: cource)
							.padding(.horizontal, 18)
					}
				}
				
				Spacer()
			}
			
		}
		.ignoresSafeArea(.all, edges: .top)
		
	}
	
	
	var headerCell: some View {
		HeaderCell(user: viewModel.user)
	}
	
	
}

struct ProfileScreenView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileScreenView(viewModel: ProfileScreenViewModel())
	}
}

