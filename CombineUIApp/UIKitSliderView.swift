//
//  UIKitSliderView.swift
//  CombineUIApp
//
//  Created by Игорь Богданов on 11.08.2022.
//

import SwiftUI

struct UIKitSliderView: UIViewRepresentable {
    
    @Binding var currentValue: Float
    var alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueDidChange(_:)),
                         for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: CGFloat(alpha)/100)
        uiView.value = currentValue
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
}

struct UIKitSliderView_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSliderView(currentValue: .constant(0.5), alpha: 94)
    }
}

extension UIKitSliderView {
    class Coordinator: NSObject {
        @Binding var currentValue: Float
        
        init(value: Binding<Float>) {
            self._currentValue = value
        }
        
        @objc func valueDidChange(_ sender: UISlider) {
            currentValue = sender.value
        }
    }
}
