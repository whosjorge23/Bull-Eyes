//
//  ContentView.swift
//  Bull Eyes
//
//  Created by Jorge Giannotta on 30/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var value: Double = 0
    @State var number : Int = Int.random(in: 0...100)
    @State var guess = ""
    @State var gameEnded : Bool = false
    @State var winGame : Bool = false
        var body: some View {
            ZStack {
                VStack {
                    Group{
                        Text("Bull's Eye ")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("🎯")
                            .font(.system(size: 50))
                    }
                    Spacer()
                    Text("Try to guess the number: \(number)")
                        .fontWeight(.semibold)
                        .font(.title2)
                    Group{
                        Slider(value: $value, in: 0...100)
                        HStack(alignment: .center, spacing: 0, content: {
                            Text("0")
                            Spacer()
                            Text("100")
                        })
                        
                    }
                    Text("\(Int(value))")
                    .padding(.horizontal)
                    Text(gameEnded ? guess : " ")
                            .padding()
                    Button(action: {
                        if gameEnded == true {
                            gameEnded = false
                            number = Int.random(in: 0...100)
                            value = 0
                            
                        }else {
                            if Int(value) == number {
                                guess = "You Won"
                                gameEnded = true
                                withAnimation(.spring()) {
                                    winGame = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    winGame = false
                                }
                            }else {
                                guess = "You Lost. Your number is: \(Int(value))"
                                gameEnded = true
                            }
                        }
                    }, label: {
                        if gameEnded == true {
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 150, height: 50, alignment: .center)
                                .foregroundColor(.gray)
                                .overlay(
                                    Text("Retry")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                )
                        }else {
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 150, height: 50, alignment: .center)
                                .foregroundColor(.red)
                                .overlay(
                                    Text("Guess")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                )
                        }
                        
                    })
                    
                    
                    Spacer()
                }
                EmitterView()
                    .scaleEffect(winGame ? 1 : 0, anchor: .top)
                    .opacity(winGame ? 1 : 0)
                    .ignoresSafeArea()
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
