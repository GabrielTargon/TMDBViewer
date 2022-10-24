//
//  LoginSceneView.swift
//  TMDBViewer
//

import SwiftUI

struct LoginView: View {
    @State var viewModel: LoginViewModel
    
    var body: some View {
        ZStack {
            Image("background_login")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200, height: 50)
                    .bold()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200, height: 50)
                    .bold()
                Button("Log in") {
                    viewModel.delegate?.didSelectLogin(viewModel)
                }
                .frame(width: 200, height: 50)
                .background(Color(uiColor: .tmdbAlgaeGreen))
                .foregroundColor(.white)
                .cornerRadius(6)
                .bold()
            }
        }
    }
}

//struct LoginSceneView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginSceneView()
//    }
//}
