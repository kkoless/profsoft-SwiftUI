//
//  StartScreenView.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 12.08.2021.
//

import SwiftUI

struct StartScreenView: View {
	
//	@EnvironmentObject var settingModel: AppSetting
	@ObservedObject var viewModel: StartScreenViewModel = StartScreenViewModel()
	
	@State var isHiddenTextField = false
	@State private var isActive = false
	@State private var isActiveSheet = false
	
	@State private var link: AppStep? = nil
	
	var body: some View {
		content
			.navigate(using: $link, flow: .onboarding)
		
	}
}

private extension StartScreenView {
	
	var content: some View {
		VStack {
			
			Button(
				action: { link = .start },
				label: {
				Text("link")
			})
		}
	}
	
	var titleView: some View {
		Text(" This is ScrollView")
	}
	
	var listUsersView: some View {
		ScrollView {
			HStack {
				ForEach(viewModel.array,
						content: userCellView(_:))
			}
		}
		.background(Color.orange)
	}
	
	func userCellView(_ user: User) -> some View {
		Text(user.name)
			.frame(maxWidth: .infinity)
	}
}

private extension StartScreenView {
	
}

struct StartScreenView_Previews: PreviewProvider {
	static var previews: some View {
		StartScreenView()
	}
}

extension View {
	
	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
