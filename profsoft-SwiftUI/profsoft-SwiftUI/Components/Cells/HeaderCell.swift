//
//  HeaderCell.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 17.08.2021.
//

import SwiftUI

struct HeaderCell: View {
	
	@State private var showingActionSheet = false
	@State var showImagePicker: Bool = false
	
	@State private var image = UIImage(named: "userImage")!
	@State var user: User
	
	var body: some View {
		content
			.sheet(isPresented: $showImagePicker) {
				ImagePickerView(sourceType: .photoLibrary) { image in
					self.image = image
				}
			}
			
	}
	
}

extension HeaderCell {
	
	var content: some View {
		
		VStack {
			
			HStack(alignment: .bottom, spacing: 0) {
				
				Button(action: onTap) {
					Image(uiImage: image)
						.resizable()
						.aspectRatio(contentMode: .fill)
						.cornerRadius(12)
				}
				.frame(width: 150, height: 150)
				.background(Image("userImageTap").cornerRadius(15))
				.cornerRadius(12)
				.actionSheet(isPresented: $showingActionSheet) {
					self.actionSheet
				}
				
				VStack(alignment: .leading, spacing: 0) {
					Text("\(user.firstName) \(user.lastName) \(user.patronymic)")
						.font(Font.custom("GolosText-DemiBold", size: 17.5))
						.lineLimit(2)
						.padding(.bottom, 7)
						.frame(maxWidth: .infinity, alignment: .leading)
					
					Text(user.email)
						.font(Font.custom("GolosText-Medium", size: 15))
					
				} // VStack 2
				.foregroundColor(.white)
				.padding(.leading, 10)
				.frame(maxWidth: .infinity, alignment: .leading)
				
				Spacer()
				
			} // HStack
			.frame(maxWidth: .infinity)
			.padding(.bottom, 23)
			.padding(.leading,16)
			
		} // VStack 1
		.frame(height: 280, alignment: .bottom)
		.background(Color(#colorLiteral(red: 0.1098039216, green: 0.1098039216, blue: 0.1098039216, alpha: 1)))
		
	}
	
}

extension HeaderCell {
	
	func onTap() {
		showingActionSheet.toggle()
	}
	
	var actionSheet: ActionSheet {
		ActionSheet(
			title: Text(""),
			buttons: [
				.default(Text("Сфотографировать")),
				.default(Text("Загрузить из галереи")) {
					showImagePicker.toggle()
				},
				.cancel(Text("Отмена"))
			]
		)
	}
	
}


struct HeaderCell_Previews: PreviewProvider {
    static var previews: some View {
		HeaderCell(user: User.emptyObj())
    }
}
