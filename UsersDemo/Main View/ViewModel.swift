//
//  ViewModel.swift
//  UsersDemo
//
//  Created by Alejandro Perea Navarrete on 28/2/22.
//

import Foundation

@MainActor final class ViewModel: ObservableObject {
    
    @Published public var users: [User] = []
    
    public func getData() async {
        do {
            users = try await getUsers().results.removingDuplicates()
        } catch {
            print("Error loading data \(error.localizedDescription)")
        }
    }
    
    private func getUsers() async throws -> Result {
        guard let url = URL(string: "https://randomuser.me/api/?results=20") else {
            return Result(results: [])
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Result.self, from: data)
    }
    
}
