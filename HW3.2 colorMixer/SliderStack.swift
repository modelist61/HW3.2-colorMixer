//
//  SliderStack.swift
//  HW3.2 colorMixer
//
//  Created by Dmitry Tokarev on 15.12.2020.
//

import SwiftUI

struct SliderStack: View {
    
    @Binding var rgbValue: Double
    @Binding var alert: Bool
    @State var tempValue = 0.0
    @State var inputValue = 0.0
    var lineColor: Color = .blue
    
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 20){
                Text("\(lround(rgbValue))")
                    .frame(width: 40)
                
                Slider(value: $rgbValue, in: 0...255, step: 1)
                    .accentColor(lineColor)
                
                TextField("\(rgbValue)", value: $rgbValue, formatter: NumberFormatter()) { _ in tempValue = rgbValue
                } onCommit: {
                    inputValue = rgbValue
                    checkRange()
                }
                    .frame(width: 50)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(radius: 10)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
    private func checkRange() {
            
        if !(0...255 ~= inputValue) {
            rgbValue = tempValue
            alert = true
        }
    }
}

struct SliderStack_Previews: PreviewProvider {
    @State static var testValue = 40.0
    @State static var showAlert = false
    static var previews: some View {
        ZStack{
            Color(.gray)
            SliderStack(rgbValue: $testValue,
                        alert: $showAlert)
        }
        .ignoresSafeArea()
    }
}
