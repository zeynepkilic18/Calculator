//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Zeynep Kılıç on 18.02.2026.
//

import SwiftUI

enum CalcButton: String  {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiply = "X"
    case divide = "/"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "±"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide,  .equal:
            return Color(red: 180/255, green: 120/255, blue: 130/255)
            
        case .clear, .negative, .percent:
            return Color(red: 210/255, green: 160/255, blue: 170/255)
            
        default:
            return Color(red: 230/255, green: 195/255, blue: 200/255)
        }
    }
}

struct ContentView: View {
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack {
            Color(red: 140/255, green: 110/255, blue: 120/255).edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                //Text
                HStack {
                    Spacer()
                    Text("0").bold().font(.system(size: 64))
                        .foregroundColor(.white)
                    
                }
                .padding()
                
                //Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                            
                            }) {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(item: item), height: self.buttonHeight(item: item))
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            }
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    func buttonWidth(item: CalcButton) -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonHeight(item: CalcButton) -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

#Preview {
    ContentView()
}
