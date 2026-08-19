//
//  radioButton.swift
//  AzRCCC
//
//  Created by Paul W Fleming on 11/20/23.
//

import SwiftUI

//MARK:- Single Radio Button Field
struct RadioButtonField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    let isMarked:Bool
    let callback: (String)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 20,
        color: Color = Color.black,
        textSize: CGFloat = 14,
        isMarked: Bool = false,
        callback: @escaping (String)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(Font.system(size: textSize))
                    .padding(.trailing, 5)
                //Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
}

// ==========================================

//MARK:- ARRL Radio Buttons
enum Arrl: String {
    case yes = "Y"
    case no = "N"
}

struct ARRLRadioButtons: View {
    let callback: (String) -> ()
    
    //@State var selectedARRL: String = "No"
    @Binding var aRRL: String
    
    var body: some View {
        HStack {
            radioYes
            radioNo
        }
    }
    
    var radioYes: some View {
        RadioButtonField(
            id: Arrl.yes.rawValue,
            label: Arrl.yes.rawValue,
            isMarked: aRRL == Arrl.yes.rawValue ? true : false,
            callback: ARRLRadioGroupCallback
        )
    }
    
    var radioNo: some View {
        RadioButtonField(
            id: Arrl.no.rawValue,
            label: Arrl.no.rawValue,
            isMarked: aRRL == Arrl.no.rawValue ? true : false,
            callback: ARRLRadioGroupCallback
        )
    }
    
    func ARRLRadioGroupCallback(id: String) {
        aRRL = id
        callback(id)
    }
}
