//
//  SingleListWithoutNavigationView.swift
//  Demo
//
//  Created by Gesen on 2020/3/22.
//

import SwiftUI

struct SingleListWithoutNavigationView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            SimpleList()
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("< Back")
                    .foregroundColor(.white)
                    .padding(.init(top: 6, leading: 8, bottom: 6, trailing: 8))
                    .background(Color.blue)
                    .cornerRadius(6)
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
    
    @Environment(\.presentationMode) var presentationMode
}

struct SingleListWithoutNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SingleListWithoutNavigationView()
    }
}
