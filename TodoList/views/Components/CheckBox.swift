//
//  CheckBox.swift
//  TodoList
//
//  Created by Maaz Bin Tausif on 16.11.25.
//

import SwiftUI

struct CheckBox: View {
    @Binding var isChecked:Bool
    var title: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                isChecked.toggle()
            }
        }){
            HStack{
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .font(.system(size: 22))
                    .foregroundColor(isChecked ? .blue : .gray)
                
                Text(title)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.vertical,4)
        }
        
    }
}

#Preview {
    CheckBox(isChecked: .constant(true), title: "tester")
}
