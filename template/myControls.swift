// version2.0

// ---------- myControls with default values ----------

// myButtonLabel(label: "My Button", width: 120, height: 35, bodyColor: G.appColor, textColor: Color(.white), disabled: false)

// myListItem(labelText: "MyLabel", labelWidth: G.labelWidth, labelBold: true, valueText: "The Value", valueWidth: 0, valueBold: false, fontSize: G.fontSize, valueColor: Color(.black))

// myMultiLineListItem(labelText: "My Label", labelWidth: G.labelWidth, labelBold: true, valueText: "The Value", valueWidth: 0, valueBold: false, valueHeight: 300, fontSize: G.fontSize)

// myExpandableListItem(labelText: "My Label", labelWidth: G.labelWidth, labelBold: true, valueText: "The Value", valueWidth: 0, valueBold: false, lineLimit: 100, fontSize: G.fontSize)

// myTextField(label: "My Label", labelWidth: G.labelWidth, labelBold: true, theValue: $string, placeHolder: "", valueWidth: 0, limit: 50, star: " *", forceUpper: false, fontSize: G.fontSize)

// mySecureField(label: "My Label", labelWidth: G.labelWidth, labelBold: true, theValue: $string, placeHolder: "", valueWidth: 0, limit: 50, star: " *", fontSize: G.fontSize)

// myNumberField(label: "My Label", labelWidth: G.labelWidth, labelBold: true, theValue: $string, placeHolder: "", valueWidth: 0, limit: 50, includeDecimal: false, star: " *")

// myPhoneField(label: "My Label", labelWidth: G.labelWidth, labelBold: true, phoneNum: $string, placeHolder: "", valueWidth: 0, star: " *")

// myTextEditor(label: "My Label", labelWidth: G.labelWidth, labelBold: true, theValue: $string, valueWidth: 0, limit: 200, star: " *", disabled: false)

// myPicker(label: "My Label", labelWidth: G.labelWidth, labelBold: true, selection: $string, choices: ["A","B","C"], pickerWidth: 0, pickerHeight: G.valueHeight, useSegmentedPicker: false, star: " *", disabled: false)

// myDatePicker(label: "My Label", labelWidth: G.labelWidth, labelBold: true, theDate: $date, )

// myAsyncImage(label: "My Label", labelWidth: G.labelWidth, labelBold: true, imageUrl: "url", valueWidth: 0, imaheHeight: 200, defaulltImage: "")

// mySlider(label: "My Label", labelWidth: G.labelWidth, labelBold: true, value: $double, valueWidth: 0, sliderWidth: 200, min: 0.0, max: 10.0)

// myToggleField(label: "My Label", labelWidth: G.labelWidth, labelBold: true, theValue: $bool, valueWidth: 0)

import SwiftUI
//import iPhoneNumberField
import PhotosUI
import Combine

// -----------------------------------------------
struct G {
// -----------------------------------------------
    static var appColor = Color(.blue)
    static var labelWidth: CGFloat = 130
    static var valueHeight: CGFloat = 35
    static var fontSize: CGFloat = 18
    static var smallFontSize: CGFloat = 15
}

// -----------------------------------------------
struct myButtonLabel: View {
// -----------------------------------------------
    
    // ================= VARIABLE DEFINITIONS  =================
    
    var label: String = "My Button"
    var width: CGFloat = 100
    var height: CGFloat = 30
    var bodyColor: Color = G.appColor
    var textColor: Color = Color(.white)
    var disabled: Bool = false
    
    // ==================== USER INTERFACE  ====================
    
    var body: some View {
        
        Text(label)
            .frame(width: width, height: height)
            .background(disabled ? Color(.systemGray3).cornerRadius(9) : Color(bodyColor).cornerRadius(9))
            .cornerRadius(15)
            .foregroundColor(textColor)
            .bold()
            .font(.headline)
            .padding(5)
    }
}

// -----------------------------------------------
struct myListItem: View {
// -----------------------------------------------
    
    // ================= VARIABLE DEFINITIONS  =================
    
    var labelText: String = "My Label"
    var labelWidth: CGFloat = G.labelWidth
    var labelBold: Bool = true
    
    var valueText: String = "The Value"
    @State var valueWidth: CGFloat = 0 // zero implies screen width
    var valueBold: Bool = false
    var fontSize: CGFloat = G.fontSize
    var valueColor: Color = Color(.black)
    
    // ==================== USER INTERFACE  ====================
    
    var body: some View {
        
        HStack (spacing: 0) {
            
            Text("\(labelText): ")
                .frame(width: labelWidth, alignment: .trailing)
                .foregroundColor(G.appColor)
                .font(.system(size: (fontSize)))
                .fontWeight(labelBold ? .bold : .regular)
            
            Text("\(valueText)")
                .frame(width: valueWidth, alignment: .leading)
                .font(.system(size: (fontSize)))
                .fontWeight(valueBold ? .bold : .regular)
                .lineLimit(1)
                .foregroundColor(valueColor)
        }
        
        // ==================== UI MODIFIERS  ==================
        
        .onAppear {
            valueWidth = valueWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth : valueWidth
        }
    }
}

// -----------------------------------------------
struct myMultilineListItem: View {
// -----------------------------------------------

    // ================= VARIABLE DEFINITIONS  =================

    var labelText: String = "My Label"
    var labelWidth: CGFloat = G.labelWidth
    var labelBold: Bool = true
    
    var valueText: String = "The Value"
    @State var valueWidth: CGFloat = 0 // zero implies screen width
    var valueBold: Bool = false
    var valueHeight: CGFloat = 300
    var fontSize: CGFloat = G.fontSize

    // ==================== USER INTERFACE  ====================

    var body: some View {
        
        HStack (spacing: 0) {
            
            Text("\(labelText): ")
                .frame(width: labelWidth, height: valueHeight, alignment: Alignment( horizontal: .trailing, vertical: .top))
                .foregroundColor(G.appColor)
                .font(.system(size: (fontSize)))
                .fontWeight(labelBold ? .bold : .regular)
                //.background(Color(.green))
            
            Text("\(valueText)")
                .frame(width: valueWidth, height: valueHeight,  alignment: Alignment( horizontal: .leading, vertical: .top))
                .font(.system(size: (fontSize)))
                .fontWeight(valueBold ? .bold : .regular)
                //.background(Color(.red))

        }

        // ==================== UI MODIFIERS  ==================

        .onAppear {
            valueWidth = valueWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth : valueWidth
        }

    }
}

// -----------------------------------------------
struct myExpandableListItem: View {
// -----------------------------------------------

    // ================= VARIABLE DEFINITIONS  =================

    var labelText: String = "My Label"
    var labelWidth: CGFloat = G.labelWidth
    var labelBold: Bool = true
    
    var valueText: String = "The Value"
    @State var valueWidth: CGFloat = 0 // zero implies screen width
    var valueBold: Bool = false
    var lineLimit: Int = 100
    var fontSize: CGFloat = G.fontSize

    // ==================== USER INTERFACE  ====================

    var body: some View {
        
        HStack (alignment: .top, spacing: 0) {
            
            Text("\(labelText): ")
                .frame(width: labelWidth, alignment: Alignment(horizontal: .trailing, vertical: .top))
                .lineLimit(lineLimit)
                .foregroundColor(G.appColor)
                .fontWeight(labelBold ? .bold : .regular)
                .font(.system(size: (fontSize)))

            Text("\(valueText)")
                .frame(width: valueWidth, alignment: Alignment( horizontal: .leading, vertical: .top))
                .lineLimit(lineLimit)
                .font(.system(size: (fontSize)))

        }

        // ==================== UI MODIFIERS  ==================

        .onAppear {
            valueWidth = valueWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth : valueWidth
        }

    }
}

// -----------------------------------------------
struct myTextField: View {
// -----------------------------------------------
    
    // ================= VARIABLE DEFINITIONS  =================
    
    var label: String = "My Label"
    var labelWidth: CGFloat = G.labelWidth
    var labelBold: Bool = true
    
    @Binding var theValue: String
    var placeHolder: String = ""
    @State var valueWidth: CGFloat = 0 // zero implies screen width
    var limit: Int = 50 // zero implies textfield is disabled
    var star: String = " *"
    var forceUpper: Bool = false
    var fontSize: CGFloat = G.fontSize
    
    // ==================== USER INTERFACE  ====================
    
    var body: some View {
        
        HStack (spacing: 0) {
            
            Text("\(label): ")
                .frame(width: labelWidth, alignment: .trailing)
                .font(.system(size: fontSize))
                .foregroundColor(G.appColor)
                .fontWeight(labelBold ? .bold : .regular)
            
            TextField(placeHolder == "" ? "" : placeHolder, text: $theValue )
                .frame(width: valueWidth, height: G.valueHeight)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(forceUpper ? .characters : .none)
                .overlay(RoundedRectangle(cornerRadius:10) .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1)))
                .font(.system(size: G.fontSize))
                .foregroundColor(limit == 0 ? .gray : .black)
                .disabled(limit == 0 ? true : false)
            
            Text(star)
                .foregroundColor(.red)
                .font(.system(size:G.fontSize))
                .frame(width: 25, alignment: .leading)
        }
        
        // ==================== UI MODIFIERS  ==================
        
        .onChange(of: theValue) {
            if theValue.count > 0 && "\\#&|".contains(theValue.last!) {
                theValue.removeLast()
            }
            if limit > 0 {
                if theValue.count > limit {
                    theValue = String(theValue.prefix(limit))
                }
            }
        }
        
        .onAppear {
            valueWidth = valueWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth - 20 : valueWidth - 20
        }
    }
}

// -----------------------------------------------
struct mySecureField: View {
// -----------------------------------------------

    // ================= VARIABLE DEFINITIONS  =================

    var label: String = "My Label"
    var labelWidth: CGFloat = G.labelWidth
    var labelBold: Bool = true
    
    @Binding var theValue: String
    var placeHolder: String = ""
    @State var valueWidth: CGFloat = 0 // zero implies screen width
    var limit: Int = 50
    var star: String = " *"
    var fontSize: CGFloat = G.fontSize
    
    // ==================== USER INTERFACE  ====================

    var body: some View {
        
        HStack (spacing: 0) {
            
            Text("\(label): ")
                .frame(width: labelWidth, alignment: .trailing)
                .font(.system(size: fontSize))
                .foregroundColor(G.appColor)
                .fontWeight(labelBold ? .bold : .regular)

            SecureField(placeHolder == "" ? "" : placeHolder, text: $theValue )
                .frame(width: valueWidth, height: G.valueHeight)
                .textFieldStyle(.roundedBorder)
                .overlay(RoundedRectangle(cornerRadius:10) .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1)))
                .font(.system(size: G.fontSize))

            Text(star)
                .foregroundColor(.red)
                .font(.system(size:G.fontSize))
                .frame(width: 25, alignment: .leading)
        }

        // ==================== UI MODIFIERS  ==================

        .onChange(of: theValue) { oldValue, newValue in
            if newValue.count > limit {
                theValue = String(theValue.prefix(limit))
            }
        }
        
        .onAppear {
            valueWidth = valueWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth - 20 : valueWidth - 0
        }
    }
}

// -----------------------------------------------
struct myNumberField: View {
// -----------------------------------------------

    // this control needs the numbersOnlyViewModifier

    // ================= VARIABLE DEFINITIONS  =================

    var label: String = "My Label"
    var labelWidth: CGFloat = G.labelWidth
    var labelBold: Bool = true
    
    @Binding var theValue: String
    @State var placeHolder: String = ""
    @State var valueWidth: CGFloat = 0 // zero implies screen width
    var limit: Int = 50
    var includeDecimal: Bool = false
    var star: String = " *"
    
    // ==================== USER INTERFACE  ====================

    var body: some View {
        
        HStack (spacing: 0) {
            
            Text("\(label): ")
                .frame(width: labelWidth, alignment: .trailing)
                .font(.system(size: G.fontSize))
                .foregroundColor(G.appColor)
                .fontWeight(labelBold ? .bold : .regular)

            TextField(placeHolder == "" ? "" : placeHolder, text: $theValue )
                .frame(width: valueWidth, height: G.valueHeight)
                .textFieldStyle(.roundedBorder)
                .overlay(RoundedRectangle(cornerRadius:10) .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1)))
                .foregroundColor(.black)
                .font(.system(size: G.fontSize))
                .numbersOnly($theValue, includeDecimal: includeDecimal)

            Text(star)
                .foregroundColor(.red)
                .font(.system(size:G.fontSize))
                .frame(width: 25, alignment: .leading)
        }

        // ==================== UI MODIFIERS  ==================

        .onChange(of: theValue) { oldValue, newValue in
            if newValue.count > limit {
                theValue = String(theValue.prefix(limit))
            }
        }
        
        .onAppear {
            valueWidth = valueWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth - 20 : valueWidth - 20
        }
    }
}

// -----------------------------------------------
struct myPhoneField: View {
// -----------------------------------------------

    // this control requires the iPhoneNumberField package
    
    // ================= VARIABLE DEFINITIONS  =================

//    var label: String = "My Label"
//    var labelWidth: CGFloat = G.labelWidth
//    var labelBold: Bool = true
//
//    @Binding var phoneNum: String
//    @State var placeHolder: String = ""
//    @State var valueWidth: CGFloat = 0 // zero implies screen width
//    var star: String = " *"
    
    // ==================== USER INTERFACE  ====================

    var body: some View {
        
//        HStack (spacing: 0) {
//             
//             Text("\(label): ")
//                 .frame(width: labelWidth, alignment: .trailing)
//                 .foregroundColor(G.appColor)
//                 .fontWeight(labelBold ? .bold : .regular)
//
//             iPhoneNumberField(placeHolder, text: $phoneNum)
//                 .flagHidden(true)
//                 .maximumDigits(10)
//                 .padding(7)
//                 .frame(width: valueWidth, height: G.valueHeight)
//                 .textFieldStyle(.roundedBorder)
//                 .overlay(RoundedRectangle(cornerRadius:10.0)
//                    .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
//                 .foregroundColor(.black)
//                 .font(.system(size: G.fontSize))
//                 
//                 
//             Text(star)
//                 .foregroundColor(.red)
//                 .font(.system(size:G.fontSize))
//                 .frame(width: 25, alignment: .leading)
//         }
//        
//        // ==================== UI MODIFIERS  ==================
//
//        .onAppear {
//            valueWidth = valueWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth - 20 : valueWidth - 20
//        }
    }
}

// -----------------------------------------------
struct myTextEditor: View {
// -----------------------------------------------

    // ================= VARIABLE DEFINITIONS  =================

    var label: String = "My Label"
    var labelWidth: CGFloat = G.labelWidth
    var labelBold: Bool = true
    
    @Binding var theValue: String
    @State var valueWidth: CGFloat = 0 // zero implies screen width
    var valueHeight: CGFloat = G.valueHeight
    var limit: Int = 200
    var star: String = " *"
    var disabled: Bool = false
    
    @FocusState private var responseIsFocused: Bool
    
    // ==================== USER INTERFACE  ====================

    var body: some View {
        
        HStack (alignment: .top, spacing: 0) {
            
            Text("\(label): ")
                .frame(width: labelWidth, alignment: Alignment( horizontal: .trailing, vertical: .top))
                .font(.system(size: G.fontSize))
                .foregroundColor(G.appColor)
                .fontWeight(labelBold ? .bold : .regular)
                .padding(.top,8)
            ZStack(alignment: .topTrailing) {
                TextEditor (text: $theValue)
                    .disabled(disabled)
                    .frame(width: valueWidth, height: valueHeight)
                    .textFieldStyle(.roundedBorder)
                    .overlay(RoundedRectangle(cornerRadius:10.0) .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                    .foregroundColor(disabled ? Color.gray : Color.black)
                    .font(.system(size: G.smallFontSize))
                    .focused($responseIsFocused)
                    .onReceive(theValue.publisher.last()) {
                        if ($0 as Character).asciiValue == 10 { // ASCII 10 = newline
                            responseIsFocused = false // unfocus TextEditor to dismiss keyboard
                            theValue.removeLast() // remove newline at end to prevent retriggering...
                        }
                    }
                if !theValue.isEmpty && !disabled {
                    Button(action: {
                        theValue = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                    }
                    .padding(.trailing, 8)
                    .padding(.top, 8)
                }

            }
            .onTapGesture {
                responseIsFocused = false
            }

            Text(star)
                .foregroundColor(.red)
                .font(.system(size:G.fontSize))
                .frame(width: 25, alignment: .leading)
        }
        .onChange(of: theValue) { oldValue,newValue in
            if newValue.count > 0 && "\\#&|".contains(newValue.last!) {
                theValue.removeLast()
            }
            if newValue.count > limit {
                theValue = String(theValue.prefix(limit))
            }
        }

        // ==================== UI MODIFIERS  ==================

        .onAppear {
            valueWidth = valueWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth - 20 : valueWidth - 20
        }

    }
}

// -----------------------------------------------
struct myPicker: View {
// -----------------------------------------------

    // ================= VARIABLE DEFINITIONS  =================

    var label: String = "My Label"
    var labelWidth: CGFloat = G.labelWidth
    var labelBold: Bool = true
    
    @Binding var selection: String
    var choices: [String] = ["A", "B", "C"]
    @State var pickerWidth: CGFloat = 0  // zero implies screen width
    @State var pickerHeight: CGFloat = G.valueHeight
    @State var useSegmentedPicker: Bool = false
    var star: String = " *"
    var disabled: Bool = false

    // ==================== USER INTERFACE  ====================

    var body: some View {
        
        HStack (spacing: 0) {
            Text("\(label): ")
                .frame(width: labelWidth, alignment: .trailing)
                .font(.system(size: G.fontSize))
                .foregroundColor(G.appColor)
                .fontWeight(labelBold ? .bold : .regular)
            if useSegmentedPicker {
                Picker("", selection: $selection) {
                    ForEach(choices, id:\.self) { choice in
                        Text(choice)
                            .tag(choice)
                    }
                }
                .disabled(disabled)
                .pickerStyle(.segmented)
                .accentColor(.black)
                .font(.system(size: G.fontSize))
                .frame(width: pickerWidth, height: pickerHeight, alignment: .leading)
                .overlay(RoundedRectangle(cornerRadius:10) .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1)))
            } else {
                Picker("", selection: $selection) {
                    ForEach(choices, id:\.self) { choice in
                        Text(choice)
                            .tag(choice)
                    }
                }
                .disabled(disabled)
                .pickerStyle(.menu)
                .accentColor(.black)
                .font(.system(size: G.fontSize))
                .frame(width: pickerWidth, height: pickerHeight, alignment: .leading)
                .overlay(RoundedRectangle(cornerRadius:10) .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1)))
            }
            
            Text(star)
                .foregroundColor(.red)
                .font(.system(size: G.fontSize))
                .frame(width: 25, alignment: .leading)

        }

        // ==================== UI MODIFIERS  ==================

        .onAppear {
            pickerWidth = pickerWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth - 20 : pickerWidth - 20
        }
    }
}

// -----------------------------------------------
struct myDatePicker: View {
// -----------------------------------------------

    // ================= VARIABLE DEFINITIONS  =================

    var label: String = "My Label"
    var labelWidth: CGFloat = G.labelWidth
    var labelBold: Bool = true
    
    @Binding var theDate: Date
    @State var pickerWidth: CGFloat = 0  // zero implies screen width

    // ==================== USER INTERFACE  ====================

    var body: some View {

        HStack (spacing: 0) {
            
            Text("\(label): ")
                .frame(width: labelWidth, alignment: .trailing)
                .font(.system(size: G.fontSize))
                .foregroundColor(G.appColor)
                .fontWeight(labelBold ? .bold : .regular)

            DatePicker("", selection: $theDate, displayedComponents: .date)
                .labeledContentStyle(ContentOnlyStyle())
                .frame(width:pickerWidth, alignment: .leading)
        }

        // ==================== UI MODIFIERS  ==================

        .onAppear {
            pickerWidth = pickerWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth + 5 : pickerWidth + 5
        }
    }
}

// this removes the label, and only shows the content (in this case, the date picker)
struct ContentOnlyStyle: LabeledContentStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
    }
}

// -----------------------------------------------
struct myAsyncImage: View {
// -----------------------------------------------

    // this control requires that there is a defaultImage in the assets folder
    
    // ================= VARIABLE DEFINITIONS  =================

    var label: String = "My Label"
    var labelWidth: CGFloat = G.labelWidth
    var labelBold: Bool = true
    
    var imageUrl: String
    @State var valueWidth: CGFloat = 0 // zero implies screen width
    var imageHeight: CGFloat = 200
    var defaultImage: String = ""
    
    // ==================== USER INTERFACE  ====================

    var body: some View {
        
        HStack (spacing: 0) {
            
            Text("\(label): ")
                .frame(width: labelWidth, height: imageHeight,
                       alignment: Alignment( horizontal: .trailing, vertical: .top))
                .font(.system(size: G.fontSize))
                .foregroundColor(G.appColor)
                .fontWeight(labelBold ? .bold : .regular)

            
            AsyncImage(url: URL(string: imageUrl)) { result in
                if let image = result.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: imageHeight)
                        .cornerRadius(10.0)
                } else {
                    if defaultImage != "" {
                        Image (defaultImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: imageHeight)
                            .cornerRadius(10.0)
                    }
                }
            }
            .frame(width: valueWidth + 15, alignment: .leading)
        }

        // ==================== UI MODIFIERS  ==================
        
        .onAppear {
            valueWidth = valueWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth - 10 : valueWidth - 10
        }

    }
}

// -----------------------------------------------
struct mySlider: View {
// -----------------------------------------------

    // ================= VARIABLE DEFINITIONS  =================

    var label: String = "My Label"
    var labelWidth: CGFloat = G.labelWidth
    var labelBold: Bool = true
    
    @Binding var value: Double
    @State var valueWidth: CGFloat = 0 // zero implies screen width
    var sliderWidth: CGFloat = 200
    var min: Double = 0.0
    var max: Double = 10.0
        
    // ==================== USER INTERFACE  ====================

    var body: some View {
        
        HStack (spacing: 0) {
            
            Text("\(label): ")
                .frame(width: labelWidth, height: G.valueHeight, alignment: .trailing)
                .font(.system(size: G.fontSize))
                .foregroundColor(G.appColor)
                .fontWeight(labelBold ? .bold : .regular)

            HStack {
                Text("\(Int(value))")
                    .frame(width: 35, height: G.valueHeight, alignment:.leading)
                    .font(.system(size: G.fontSize))
                    .foregroundColor(.black)
                
                Slider(value: $value, in: min...max, step: 1)
                    .accentColor(G.appColor) // this does not work
                    .tint(G.appColor)
                    .frame(width: sliderWidth)
            }
            .frame(width: valueWidth, alignment: .leading)
            
        }

        // ==================== UI MODIFIERS  ==================

        .onAppear {
            valueWidth = valueWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth + 5 : valueWidth + 5
        }

    }
}

// -----------------------------------------------
struct myToggleField: View {
// -----------------------------------------------

    // ================= VARIABLE DEFINITIONS  =================

    var label: String = "My Label"
    var labelWidth: CGFloat = G.labelWidth
    var labelBold: Bool = true
    
    @Binding var theValue: Bool
    @State var valueWidth: CGFloat = 0 // zero implies screen width
    
    // ==================== USER INTERFACE  ====================

    var body: some View {
        
        HStack (spacing: 0) {
            
            Text("\(label): ")
                .frame(width: labelWidth, alignment: .trailing)
                .font(.system(size: G.fontSize))
                .foregroundColor(G.appColor)
                .fontWeight(labelBold ? .bold : .regular)
            
            Toggle("", isOn: $theValue )
                .frame(width: 50)
                .frame(width: valueWidth, height: G.valueHeight, alignment: .leading)
            
            Text("")
                .foregroundColor(.red)
                .font(.system(size:G.fontSize))
                .frame(width: 8, alignment: .leading)
        }
        
        // ==================== UI MODIFIERS  ==================

        .onAppear {
            valueWidth = valueWidth == 0 ? UIScreen.main.bounds.size.width - labelWidth - 5 : valueWidth - 5
        }
    }
}
