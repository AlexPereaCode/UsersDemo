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
        ForEach(viewModel.users, id: \.self) { user in
            Text("\(user.name.first) \(user.name.last)")
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
