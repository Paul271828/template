/*
 
You can use this template to set up the structure
of a new app, add a new page to an existing app, or
create a structure for a subview.

For a new app ..
================
 
1.  create your new app
2.  in xcode open both the template and your app
3.  in the template file copy everything below "struct"
4.  in your app paste over everything below "struct"
5.  in project navigator copy "myControls" and "Helpers" to your app
6.  if you intend to use myPhoneField...
      - uncomment it in myControls
      - uncomment "import iPhoneNumberField" in myControls

To add a new page to an existing app ...
========================================

1.  Open the template folder in Finder
2.  Drag template.swift into your project folder.
3.  Rename all occurances of "template"
4.  Rename the template file in project navigator
5.  Delete these comments

To create a subview file ...
============================

1.  Copy SubViewTemplate.swift into your project navigator
2.  Change the name of the struct
 
*/

import SwiftUI

struct Template: View {
    
    // ==================== PASSED IN DATA  ====================
    
    // ================= VARIABLE DEFINITIONS  =================
    
    // general purpose alert
    @State var alertMessage = ""
    @State var isShowingAlert: Bool = false
    
    // ==================== USER INTERFACE  ====================
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Text("Template")
                
            }

            // ================== UI MODIFIERS  ================
            
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
