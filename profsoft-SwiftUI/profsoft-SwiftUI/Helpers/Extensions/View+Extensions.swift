//
//  Extensions.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 12.08.2021.
//


import SwiftUI

extension View {
	@ViewBuilder
	func navigate(
		using binding: Binding<AppStep?>,
		isDetailLink: Bool = false,
		flow: AppFlow
	) -> some View {
		background(NavigationLink<EmptyView, AnyView>(binding, flow: flow)?
					.isDetailLink(isDetailLink).toAnyView())
	}
}

extension NavigationLink where Label == EmptyView {
	init?(
		_ binding: Binding<AppStep?>,
		flow: AppFlow
	) {
		guard let step = binding.wrappedValue else {
			return nil
		}

		let isActive = Binding(
			get: { true },
			set: { newValue in if !newValue { binding.wrappedValue = nil } }
		)
		
		var destination:  some View {
			switch flow {
				case .general: return GeneralFlow.build(step).toAnyView()
					
			}
		}

		self.init(destination: destination as! Destination,
				  isActive: isActive,
				  label: EmptyView.init)
	}
}

extension View {
	func toAnyView() -> AnyView {
		AnyView(self)
	}
}

extension View {
	
	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
