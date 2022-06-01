//
//  LoginView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 14.05.2022.
//

import SwiftUI
import Combine
import CodingStyleSPM

struct LoginView: View {
    
    // MARK: - Properties
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    @State private var showIncorrectCredentialsWarning = false
    @Binding var isUserLoggedIn: Bool
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true},
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    )
        .removeDuplicates()
    

    
    // MARK: - Body view
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView(showsIndicators: false) {
                VStack {
                    if shouldShowLogo {
                        Text("VK Client")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                            .foregroundColor(.blue)
                    }
                    VStack {
                        HStack {
                            Text("Login:")
                            Spacer()
                            TextField("", text: $login)
                                .frame(maxWidth: 200)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Text("Password:")
                            Spacer()
                            SecureField("", text: $password)
                                .frame(maxWidth: 200)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                    .frame(maxWidth: 300)
                    .padding()
                    
                    Button(action: verifyLoginData) {
                        Text("Log in")
                            .frame(maxWidth: 100)
                    }
                    .disabled(login.isEmpty || password.isEmpty)
                    .buttonStyle(CustomButtonStyle())

                }
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    self.shouldShowLogo = isKeyboardOn
                }
            }
        }
        .onTapGesture { UIApplication.shared.endEditing() }
        .alert(isPresented: $showIncorrectCredentialsWarning, content: { Alert(title: Text("Error"), message: Text("Incorrect Login/Password was entered")) })
        // Gradient
        .padding(.horizontal, 50.0)
        .aspectRatio(contentMode: .fill)
        .background(LinearGradient(gradient: Gradient(colors: [.white, .blue]),
                                                        startPoint: .top,
                                                        endPoint: .bottom))
    }
    
    // MARK: - Private methods
    
    private func verifyLoginData() {
        if login == "Admin" && password == "1234" {
            isUserLoggedIn = true
        } else {
            showIncorrectCredentialsWarning = true
        }
        password = ""
    }

}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil,
                                                                from: nil,
                                                                for: nil)
    }
}

// MARK: - Screen content view

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isUserLoggedIn: .constant(false))
    }
}



