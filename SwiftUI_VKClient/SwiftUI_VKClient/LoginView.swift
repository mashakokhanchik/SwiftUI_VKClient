//
//  LoginView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 14.05.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    // MARK: - Properties
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    
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
            ZStack {
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
                    
                        Button(action: { print("Hello") }) {
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
        }
        .padding(.horizontal, 50.0)
        .aspectRatio(contentMode: .fill)
        .background(LinearGradient(gradient: Gradient(colors: [.white, .blue]),
                                                    startPoint: .top,
                                                    endPoint: .bottom))
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
        LoginView()
    }
}

// MARK: - Custom UI style

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(.blue)
            .foregroundColor(.black)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

//struct CustomBackgroundStyle {
//    func makeBody() {
//        .padding(.horizontal, 100.0)
//        .aspectRatio(contentMode: .fill)
//        .background(LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom))
//    }
//}
