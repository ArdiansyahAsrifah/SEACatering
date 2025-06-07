//
//  ContentView.swift
//  SEACatering
//
//  Created by Muhammad Ardiansyah Asrifah on 07/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FeaturesViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 0) {
                        HeaderView()
                        
                        VStack(spacing: 30) {
                            WelcomeSection()
                                .scaleEffect(viewModel.animateWelcome ? 1.0 : 0.8)
                                .opacity(viewModel.animateWelcome ? 1.0 : 0.0)
                                .animation(.easeOut(duration: 0.6).delay(0.2), value: viewModel.animateWelcome)
                            
                            FeaturesSection(features: viewModel.features)
                                .offset(y: viewModel.animateFeatures ? 0 : 50)
                                .opacity(viewModel.animateFeatures ? 1.0 : 0.0)
                                .animation(.easeOut(duration: 0.6).delay(0.4), value: viewModel.animateFeatures)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 30)
                        .padding(.bottom, 50)
                    }
                }
                .ignoresSafeArea(.container, edges: .top)
                .onAppear {
                    viewModel.animateWelcome = true
                    viewModel.animateFeatures = true
                }
                
                FloatingContactButton()
            }
            .navigationBarHidden(true)
        }
    }
    
    // Kamu bisa pindahkan ini ke komponen sendiri, saya buat di bawah
    func openWhatsApp() {
        let phoneNumber = "628123456789" // Ganti nomor
        let appURL = URL(string: "https://wa.me/\(phoneNumber)")!
        
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL)
        } else {
            print("WhatsApp tidak tersedia")
        }
    }
}

struct FloatingContactButton: View {
    func openWhatsApp() {
        let phoneNumber = "628123456789"
        let appURL = URL(string: "https://wa.me/\(phoneNumber)")!
        
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL)
        } else {
            print("WhatsApp tidak tersedia")
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    openWhatsApp()
                }) {
                    HStack {
                        Image(systemName: "phone.fill")
                            .font(.title2)
                        Text("Hubungi Kami")
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(red: 0.42, green: 0.36, blue: 0.90), Color(red: 0.64, green: 0.61, blue: 1.0)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 30)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
