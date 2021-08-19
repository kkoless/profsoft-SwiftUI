//
//  SplashLogo.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 19.08.2021.
//

import SwiftUI

struct SplashLogo: View {
	
	@State var xOffset: CGFloat = 50
	
	var body: some View {
		
		HStack(alignment: .center){
			Image("leftPart")
				.offset(x: xOffset , y: 0)
				.onAppear {
					withAnimation(.linear(duration: 2)) {
						self.xOffset = 10
					}
				}
			
			Toggle(
				isOn: .constant(true),
				label: { EmptyView() }
			).toggleStyle(SwitchToggleStyle(tint: .yellow))
			.frame(width: 53)
			
			
			Image("rightPart")
		}

	}
	
}

struct SplashLogo_Previews: PreviewProvider {
	static var previews: some View {
		SplashLogo()
	}
}
