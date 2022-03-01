//
//  CardView.swift
//  UsersDemo
//
//  Created by Alejandro Perea Navarrete on 1/3/22.
//

import SwiftUI

struct CardView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: user.picture.large)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .scaledToFit()
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(user.name.first) \(user.name.last)")
                        .font(.title)
                        .bold()
                    Text(user.email)
                        .font(.subheadline)
                        .bold()
                    Text(user.phone)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

            }.padding(.horizontal)
        }
        .padding(.bottom)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let imageStringURL = "https://cdn.grupoelcorteingles.es/SGFM/dctm/MEDIA03/202007/09/00108341135633____5__640x640.jpg"
        let previewUser = User(gender: .male,
                               name: Name(first: "Baby", last: "Yoda"),
                               email: "babyyoda@starwars.com",
                               phone: "+34689457154",
                               login: Login(uuid: "564385ghjgfhj263723"),
                               picture: Picture(large: imageStringURL,
                                                medium: imageStringURL,
                                                thumbnail: imageStringURL))
        CardView(user: previewUser)
    }
}
