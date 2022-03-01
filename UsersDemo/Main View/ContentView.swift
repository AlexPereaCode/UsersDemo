//
//  ContentView.swift
//  UsersDemo
//
//  Created by Alejandro Perea Navarrete on 28/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.users, id: \.self) { user in
                    CardView(user: user)
                }
                .listRowInsets(EdgeInsets(top: .zero, leading: .zero, bottom: 20, trailing: .zero))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Users Example")
        }
        .task {
            await viewModel.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
