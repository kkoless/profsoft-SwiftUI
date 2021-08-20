//
//  SplashScreenView.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 19.08.2021.
//

import SwiftUI

struct SplashScreenView: View {
	
	@State private var xOffsetLeft: CGFloat = 60
	@State private var xOffsetRight: CGFloat = 0
	
    var body: some View {
		VStack{
			Group {
				Spacer()
				Spacer()
				Spacer()
				Spacer()
			}
			
			companyLogo
				.padding(.leading, -50)
				.padding(.bottom, 355)
				.frame(maxWidth: .infinity)
			
			Spacer()
		}
		
    }
	
	var companyLogo: some View {
		HStack(alignment: .center) {
			Image("leftPart")
				.offset(x: xOffsetLeft , y: 0)
				.onAppear {
					self.xOffsetLeft = 10
				}.animation(.spring())
			
			ZStack {
				
				Image("rightPart")
					.offset(x: xOffsetRight , y: 0)
					.onAppear {
						self.xOffsetRight = 55
					}.animation(.spring())
				
				Toggle(
					isOn: .constant(true),
					label: { EmptyView() }
				).toggleStyle(SwitchToggleStyle(tint: .yellow))
				.frame(width: 53)
				
			} // ZStack
			
		} // HStack
		
	}
	
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
		SplashScreenView()
    }
}
