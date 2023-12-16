//
//  SliderViewUIkit.swift
//  HW4
//
//  Created by Vlad on 16.12.23..
//

import SwiftUI

struct SliderViewUIkit: UIViewRepresentable {
    
    @Binding var value: Double
    
    let color: UIColor
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumTrackTintColor = .black
        slider.maximumTrackTintColor = .black
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(value)
        
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ view: UISlider, context: Context) {
        view.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderViewUIkit {
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        SliderViewUIkit(value: .constant(100), alpha: 50, color: .black)
    }
}
