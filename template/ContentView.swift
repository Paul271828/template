//
//  You can use this template to set up the structure of your app
//
//  1.  create your new app
//  2.  in xcode open both the template and your app
//  3.  in the template copy everything below "struct"
//  4.  in your app paste over everything below "struct"
//  5.  in project navigator copy "Models", "myControls" and "Helpers" to your app
//  6.  if you intend to use myPhoneField...
//        - uncomment it in myControls
//        - uncomment "import iPhoneNumberField" in myControls
//        - add package dependency: iPhoneNumberField
//

import SwiftUI

struct ContentView: View {
    
    // ==================== PASSED IN DATA  ====================
    
    // ================= VARIABLE DEFINITIONS  =================
    
    // general purpose alert
    @State var alertMessage = ""
    @State var isShowingAlert: Bool = false
    
    // ==================== USER INTERFACE  ====================
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Text("See comments in ContentView")
            }

            // ==================== UI MODIFIERS  ==================
            
            .padding()
            
            .onAppear {
            }
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Template")
                        .font(Font.largeTitle.bold())
                        .foregroundColor(G.appColor)
                }
            }
            
            .alert(isPresented: $isShowingAlert, content: {
                Alert(title: Text(alertMessage))
            })
            
        } // end navigation stack
        
    } // end body

    // ====================== FUNCTIONS  =======================

}
