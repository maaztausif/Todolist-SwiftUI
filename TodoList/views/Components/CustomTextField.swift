//
//  CustomTextField.swift
//  TodoList
//
//  Created by Maaz Bin Tausif on 15.11.25.
//

import SwiftUI

struct CustomTextField: View {
    
    var title:String?
    @Binding var text:String
    
    var placeholder:String = "Group Name"
    var validationMessage:String?
    var leadingImage:Image?
    var trailingImage:Image?
    @State var isSecureInternal: Bool = true
    var trailingAction:(()->Void)?
    
    
    var body: some View {
        VStack(alignment: .leading){
            if let title{
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 1))
                    .frame(height: 50)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .frame(height: 50)
                    .overlay {
                        HStack(spacing:0) {
                            leadingImage
                                .padding(.leading)
                            // TextField / SecureField
                            if isSecureInternal {
                                SecureField("", text: $text, prompt: Text(placeholder).foregroundColor(.white.opacity(0.6)))
                                    .padding()
                            } else {
                                TextField("", text: $text, prompt: Text(placeholder).foregroundColor(.white.opacity(0.6)))
                                    .padding()
                            }
                            if let trailingImage {
                                Button {
                                    isSecureInternal.toggle()
                                    trailingAction?()
                                } label: {
                                    trailingImage
                                        .foregroundColor(.white)
                                        .padding(.trailing)
                                }
                            }
                        }
                        .foregroundColor(.white)
                        
                        
                    }
                    .foregroundColor(.white)
            }
        }
        
        if let validationMessage, validationMessage != ""{
            Text(validationMessage)
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(.red)
        }
    }
}



struct FormFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(title: "title", text: .constant("Value"), leadingImage: Image(systemName: "envelope"))
    }
}
