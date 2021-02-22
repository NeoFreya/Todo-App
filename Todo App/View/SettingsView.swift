//
//  SettingsView.swift
//  Todo App
//
//  Created by Abdul Halim on 22/02/21.
//  Copyright © 2021 NEONFACT. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack (alignment : .center, spacing: 0){
                
                Form{
                    
                    Section(header : Text("Follow us on media social media")){
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "instagram", link: "https://www.instagram.com/vcat.id/")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "twitter", link: "https://twitter.com/AbdulHa53725975")
                        FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Trip website", link: "https://trip-website.vercel.app/index.html")
                    }
                    .padding(.vertical, 3)
                    
                    Section(header: Text("About the Application")){
                        
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Devoloper", secondText: "Halim / Great")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Abdul Halim")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    }
                    .padding(.vertical, 3)
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                Text("2020 © Copyright • All rights reserved • Made in Martapura")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
            }
            .navigationBarItems(trailing: Button(action : {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName: "xmark")
                }
            )
                .navigationBarTitle("Setting", displayMode: .inline)
                .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
