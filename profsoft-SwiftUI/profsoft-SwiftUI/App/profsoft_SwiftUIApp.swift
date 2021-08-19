//
//  profsoft_SwiftUIApp.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 12.08.2021.
//

import SwiftUI
import Combine

@main
struct profsoft_SwiftUIApp: App {
	
	@StateObject var viewModel = StartScreenViewModel()
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
	@State var endSplash: Bool = false
	
	var body: some Scene {
		WindowGroup {
			
			ZStack{
				
				NavigationView {
					StartScreenView(viewModel: viewModel)
				}
				
				SplashScreenView()
					.onAppear(perform: animateSplash)
					.opacity(endSplash ? 0 : 1)
					.animation(.easeInOut(duration: 0.5))
				
			} // ZStack
			
		} // WindowGroup
	}
	
	func animateSplash() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			endSplash.toggle()
		}
	}
	
}
