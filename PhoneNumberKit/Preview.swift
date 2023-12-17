//
//  Preview.swift
//  PhoneNumberKit
//
//  Created by Abdulla on 17.12.2023.
//  Copyright © 2023 Roy Marmelstein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct PhoneNumberField: UIViewRepresentable {
    @Binding var phoneNumber: String
    private let textField = PhoneNumberTextField()
 
    func makeUIView(context: Context) -> PhoneNumberTextField {
        textField.withExamplePlaceholder = false
        textField.withFlag = true
        textField.withPrefix = true
        textField.withDefaultPickerUI = true
        textField.isEnabled = false
        
        textField.textColor = .white
        textField.tintColor = .white
        textField.numberPlaceholderColor = .white
        textField.countryCodePlaceholderColor = .white
//        textField.becomeFirstResponder()
        textField.addTarget(context.coordinator, action: #selector(Coordinator.onTextUpdate), for: .editingChanged)
        let view = textField
        return view
    }
    
    func updateUIView(_ view: PhoneNumberTextField, context: Context) {

    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {

        var control: PhoneNumberField

        init(_ control: PhoneNumberField) {
            self.control = control
        }

        @objc func onTextUpdate(textField: UITextField) {
            self.control.phoneNumber = textField.text!
        }

    }

}

#Preview(body: {
    VStack {
        PhoneNumberField(phoneNumber: .constant("123"))
            .padding()
            .background(Color.black)
    }
})
