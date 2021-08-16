//
//  HeaderCell.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import SwiftUI

struct HeaderCell: View {
	
	@State private var userImageTap: Bool = false
	@State private var isShowPhotoLibrary = false
	@State private var image = UIImage()
	
	var body: some View {
		content
			.sheet(isPresented: $isShowPhotoLibrary) {
				ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
			}
	}
}

extension HeaderCell {
	
	var content: some View {
		
		VStack {
		
			HStack(alignment: .bottom, spacing: 0) {
				
				Button(action: { isShowPhotoLibrary.toggle() }) {
					Image(uiImage: image)
						.resizable()
						.aspectRatio(contentMode: .fill)
				}
				.frame(width: 150, height: 150)
				.cornerRadius(12)
				.background(Image("userImageTap"))
				
				VStack(alignment: .leading, spacing: 0) {
					Text("КОЖИН АЛЕКСАНДР СЕРГЕЕВИЧ").bold()
						.padding(.bottom, 7)
					Text("kologram@gmail.com")
				}
				.foregroundColor(.white)
				.padding(.leading, 7)

				Spacer()
			}
			.frame(maxWidth: .infinity)
			.padding(.bottom, 23)
			.padding(.leading,16)
			
		}
		.frame(height: 280, alignment: .bottom)
		.background(Color(#colorLiteral(red: 0.1098039216, green: 0.1098039216, blue: 0.1098039216, alpha: 1)))
		
	}
	
}


struct HeaderCell_Previews: PreviewProvider {
    static var previews: some View {
		HeaderCell()
    }
}
