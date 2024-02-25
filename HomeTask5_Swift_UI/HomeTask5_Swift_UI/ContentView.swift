//
//  ContentView.swift
//  HomeTask5_Swift_UI
//
//  Created by Павел Яновский on 25.02.2024.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Узнаем новости?")
                .font(.title)
                .padding(.vertical, 20)
            
            NavigationLink(destination: NewsListView()) {
                Text("Читать")
                    .font(.body)
                    .frame(width: 150, height: 50)
                    .background(Color(#colorLiteral(red: 0.2980392277, green: 0.6823529601, blue: 0.3137255013, alpha: 1)))
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white) // Фоновый цвет экрана
        .edgesIgnoringSafeArea(.all) // Игнорировать отступы безопасной области
    }
}

