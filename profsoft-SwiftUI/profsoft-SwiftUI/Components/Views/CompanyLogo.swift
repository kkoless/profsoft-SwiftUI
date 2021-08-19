//
//  CompanyLogo.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 13.08.2021.
//

import SwiftUI

struct CompanyLogo: View {
	
    var body: some View {
		
		HStack(alignment: .center){
			Image("leftPart")
				.offset(x: 10 , y: 0)
			
			Toggle(
				isOn: .constant(true),
				label: { EmptyView() }
			).toggleStyle(SwitchToggleStyle(tint: .yellow))
			.frame(width: 53)
			
			
			Image("rightPart")
		}

    }
	
}

struct CompanyLogo_Previews: PreviewProvider {
    static var previews: some View {
        CompanyLogo()
    }
}
