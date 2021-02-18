//
//  EmptyListViews.swift
//  Todo App
//
//  Created by Abdul Halim on 18/02/21.
//  Copyright © 2021 NEONFACT. All rights reserved.
//

import SwiftUI

struct EmptyListViews: View {
    
    @State private var isAnimated : Bool = false
    
//    Image Vector
    let images : [String] = [
        "illustration-no1",
        "illustration-no2",
        "illustration-no3"
    ]
    
//    Kata-Kata Motivasi
    let tips : [String] = [
        "Use your time wisely. ",
        "Slow and steady wins the race.",
        "Keep it short and sweet.",
        "Put hard task first.",
        "Reward your self after work.",
        "Prepare your self for tomorrow"
    ]
    
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing:  20){
                Image("\(images.randomElement() ?? self.images[0])")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth : 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                    .layoutPriority(1)
                Text("\(tips.randomElement() ?? self.tips[0])")
                    .layoutPriority(0.5)
                    .font(.system(.headline, design : .rounded))
            }
            .padding(.horizontal)
            .opacity(isAnimated ? 1 : 0)
            .offset(y : isAnimated ? 0 : -50)
            .animation(.easeOut(duration : 1.5))
            .onAppear(perform: {
                self.isAnimated.toggle()
            })
        }
        .frame(minWidth : 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct EmptyListViews_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListViews()
    }
}
