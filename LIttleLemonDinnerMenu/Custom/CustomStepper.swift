//
//  CustomStepper.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-08-12.
//

import Foundation
import SwiftUI

struct CustomStepper<Label: View>: View {
    @Binding var value: Int
    @ViewBuilder var label: Label
    
    @Environment(\.controlSize)
    var controlSize
    
    // Have different set size for the rectangle
    var padding: Double {
        switch controlSize {
        case .mini: return 4
        case .small: return 6
        default: return 8
        }
    }
    
    // Have different set size for the font
    var font: Font {
        switch controlSize {
        case .mini: return .footnote
        case .small: return .callout
        default: return .body
        }
    }
    
    var body: some View {
        // Stepper in itself
        HStack {
            Button("-") {
                if self.value <= 1 {
                    self.value = 1
                } else {
                    self.value -= 1
                }
            }
            self.label
                .padding(.horizontal)
            Button("+") { self.value += 1}
        // The padding evolves according to the modifiers
        }.padding(.vertical, self.padding)
            .padding(.horizontal, self.padding * 2)
        .background {
            // Use of the custom shape as back
            RoundedCornerShape(corners: .allCorners, radius: 5)
                .fill(.thickMaterial)
        }
        // Adjust the font according to the modifiers
        .font(font)
        // Allows to take off the blue coloring
        .buttonStyle(.plain)
    }
}

struct CustomStepper_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomStepper(value: .constant(10), label: { Text("Value") })
            CustomStepper(value: .constant(10), label: { Text("Value") })
                .controlSize(.mini)
        }
        .padding()
    }
}
