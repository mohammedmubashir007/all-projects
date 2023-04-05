//
//  MenuView.swift
//  CoolBeans
//
//  Created by Mohammed Mubashir on 22/03/23.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menu : Menu
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: columns,pinnedViews: .sectionHeaders) {
                    ForEach(menu.sections){
                        section in
                        Section{
                            ForEach(section.matches(for: searchText)){
                                drink in
                                
                                NavigationLink{
                                    CustomizeView(drink: drink){
                                        dismiss()
                                    }
                                }label: {
                                    
                                    VStack{
                                        Image(drink.image)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                        Text(drink.name)
                                            .font(.system(.body,design: .serif))
                                    }
                                    .padding(.bottom)
                                }
                                .buttonStyle(.plain)
                            
                            }
                        }header:{
                        Text(section.name)
                            .font(.system(.title,design: .serif))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.top,.bottom],5)
                            .background(.background)
                        
                    }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Add Drink")
            .searchable(text: $searchText)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(Menu())
    }
}