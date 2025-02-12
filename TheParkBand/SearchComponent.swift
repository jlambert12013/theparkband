//
//  SearchComponent.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/12/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var search :String
    @State var show = true
    
    var body: some View {
        ZStack{
            ZStack{
                if show{
                    TextField("Search", text: $search)
                        .padding(.leading)
                }
                
            }
            .frame(height: 55)
            .frame(maxWidth: show ? .infinity : 55)
            .background(.gray.tertiary,in:.capsule)
            .overlay(alignment: show ? .trailing : .center) {
                Image(systemName:show ? "xmark" : "magnifyingglass")
                    .font(.title)
                    .contentTransition(.symbolEffect)
                    .onTapGesture {
                        withAnimation {
                            show.toggle()
                            search = ""
                        }
                    }
                    .padding(.trailing , show ? 15 : 0)
            }
            .clipped()
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
    }
}

#Preview {
    SearchBar(search: .constant(""))
}
