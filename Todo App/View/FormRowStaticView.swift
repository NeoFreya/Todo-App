//
//  FormRowStaticView.swift
//  Todo App
//
//  Created by Abdul Halim on 22/02/21.
//  Copyright © 2021 NEONFACT. All rights reserved.
//

import SwiftUI

struct FormRowStaticView: View {
    
    var icon : String
    var firstText : String
    var secondText : String
    
    var body: some View {
        HStack {
            // Button
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.gray)
                Image(systemName: icon)
                    .foregroundColor(Color.white)
            }
            // Design Button
            .frame(width : 36, height: 36, alignment: .center)
            
            // Text
            Text(firstText).foregroundColor(Color.gray)
            Spacer()
            Text(secondText)
        }
    }
    
}


struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowStaticView( icon: "gear", firstText: "Application", secondText: "Todo")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
