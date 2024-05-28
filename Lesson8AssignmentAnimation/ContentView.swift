//
//  ContentView.swift
//  Lesson8AssignmentAnimation
//
//  Created by Sandra Gomez on 5/27/24.
//
import SwiftUI

struct ContentView: View {
    
    @State private var isMoved = false
    @State private var scaleBlue: CGFloat = 1.0
    @State private var scaleYellow: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                withAnimation(.easeIn(duration: 1.0)) {
                    self.scaleBlue = self.scaleBlue == 1.0 ? 1.5 : 1.0
                }
            }) {
                Text("Tap me")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .scaleEffect(scaleBlue)
            }
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
                .offset(x: isMoved ? 150 : 0)
                .animation(.easeOut(duration: 1.0), value: isMoved)
            
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
                .offset(x: isMoved ? -150 : 0)
                .animation(.easeInOut(duration: 1.0), value: isMoved)
            
            Button(action: {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0)) {
                    self.scaleYellow = self.scaleYellow == 1.0 ? 1.5 : 1.0
                }
            }) {
                Text("Tap me")
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .scaleEffect(scaleYellow)
            }
        }
        .onTapGesture {
            isMoved.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

