//
//  ConfettiEmitter.swift
//  Bull Eyes
//
//  Created by Jorge Giannotta on 01/06/21.
//

import SwiftUI

struct EmitterView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        
        //Emitter Layer
        let emitterLayer = CAEmitterLayer()
        //Since we need top to down amination
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = createEmiterCells()
        
        // Size And Postion...
        emitterLayer.emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 1)
        emitterLayer.emitterPosition = CGPoint (x: UIScreen.main.bounds.width / 2, y: 0)
        
        view.layer.addSublayer(emitterLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func createEmiterCells() -> [CAEmitterCell]{
        
        //Multiple Differect Shped Emmiters
        var emitterCells : [CAEmitterCell] = []
        var colorArray : [UIColor] = [.green, .white, .red]
        var randomColor = colorArray.randomElement()
        for index in 1...10{
            let cell = CAEmitterCell()
            cell.contents = UIImage(named: "star")?.cgImage
            cell.color = getColor(index: index).cgColor
            //New Particle Creation Time
            cell.birthRate = 4.5
            //Life of Particles
            cell.lifetime = 20
            //Velocity
            cell.velocity = 120
            //Scale
            cell.scale = 0.2
            cell.scaleRange = 0.3
            cell.emissionLongitude = .pi
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 1
            
            //Acceleration
            cell.yAcceleration = 40
            
            emitterCells.append(cell)
        }
        
        return emitterCells
    }
    
    func getColor(index: Int) -> UIColor {
        let colors : [UIColor] = [.green,.white,.red]
        
        return colors.randomElement()!
    }
}
