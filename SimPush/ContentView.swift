//
//  ContentView.swift
//  SimPush
//
//  Created by Reza Khonsari on 4/5/20.
//  Copyright © 2020 Reza Khonsari. All rights reserved.
//

import SwiftUI






struct ContentView: View {
    
    
    @State private var textViewValue = DefaultJSON
    @State private var identifier = ContentView.savedIdentifier
    @State private var buttonIsHidden = true
    
    private let savedAPNSurl = FileManager.document.appendingPathComponent("NotificationPaylod-Demo.apns")
    
    static var savedIdentifier : String {
        get { UserDefaults.standard.string(forKey: "identifier") ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: "identifier") }
    }
    
    
    
    
    var body: some View {
        return VStack {
            
            HStack {
                Text("Device Identifier: ")
                
                TextField("", text: $identifier, onEditingChanged: { changed in
                    if changed {
                        self.buttonIsHidden = false
                    }
                }, onCommit: { })
                
                
                Button(action: {
                    ContentView.savedIdentifier = self.identifier
                    self.buttonIsHidden = true
                }) {
                    Text("Save")
                }
                .isHidden(buttonIsHidden, remove: buttonIsHidden)
                }
            .padding()
            
            
            
            MacEditorTextView(text: $textViewValue, onEditingChanged: {}, onCommit: { }) { value in
                debugPrint(value)
            }
            
            Button(action: {
                do {
                    try self.textViewValue.write(to: self.savedAPNSurl, atomically: true, encoding: .utf8)
                    let shellResult = try doShell("xcrun", "simctl", "push" , self.identifier, self.savedAPNSurl.path)
                    debugPrint(shellResult)
                    
                } catch ShellError.APNSPathIsIncorrect {
                    NSAlert(error: NSError(domain: "APNS file dosen't exists", code: .zero))
                        .runModal()
                        
                } catch {
                    NSAlert(error: error)
                    .runModal()
                }

            }) {
                Text("Push")
                    .bold()
                }.padding()
        }.onAppear {
            if FileManager.default.fileExists(atPath: self.savedAPNSurl.path),
                let savedAPNSdata = try? Data(contentsOf: self.savedAPNSurl),
                let savedAPNSstring = String(data: savedAPNSdata, encoding: .utf8) {
                self.textViewValue = savedAPNSstring
            }
        }
        
        

        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
