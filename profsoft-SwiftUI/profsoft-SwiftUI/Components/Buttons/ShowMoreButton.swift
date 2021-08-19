//
//  ShowMoreButton.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import SwiftUI

struct ShowMoreButton: View {
	
    var body: some View {
        content
    }
}

extension ShowMoreButton {
	
	var content: some View {
		VStack(spacing: 0) {
			Button(action: {}, label: {
				Image("showMore")
			})
			.padding(.bottom, 16)
			
			Image("separator")
		}
		.frame(maxWidth: .infinity)
	}
	
}

struct ShowMoreButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowMoreButton()
    }
}
