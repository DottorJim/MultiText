//
//  ContentView.swift
//  MultiText
//
//  Created by Adriano on 07/08/2020.
//  Copyright © 2020 Adriano Dassu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var value: CGFloat = 0
    @State var displayText: String = ""
    
    var body: some View {
        
        VStack {
            
            MulitilineTextField(placeholder: "Scrivi qualcosa:", text: self.$displayText)
                .padding()
                .frame(height: 100) // Da adattare a piacere
        }
        .frame(minWidth: nil, idealWidth: nil, maxWidth: 800, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .center)
        .offset(y: -self.value)
        .animation(.spring())
        .onAppear {
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                
                let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                
                let height = value.height
                
                self.value = height
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                
                self.value = 0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
