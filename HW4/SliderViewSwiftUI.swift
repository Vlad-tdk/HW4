//
//  SliderViewSwiftUI.swift
//  HW4
//
//  Created by Vlad on 16.12.23..
//

import SwiftUI

struct SliderViewSwiftUI: View {
    @Binding var currentValue: Double
    
    let targetValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                SliderViewUIkit(value: $currentValue, alpha: alpha, color: color)
                Text("100")
            }
            .padding()
        }
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        SliderViewSwiftUI(
            currentValue: .constant(50),
            targetValue: 100,
            color: .black,
            alpha: 100
        )
    }
}
