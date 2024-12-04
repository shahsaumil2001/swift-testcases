//
//  LoginVC+Validations.swift
//  Swift-Login-XCTest
//
//  Created by Saumil Shah on 27/11/24.
//

import UIKit
/// Enum to define validation types.
enum ValidationType {
    case email
    case password
}

extension LoginViewController {
    /// Validates the text fields in the LoginViewController.
    func isValidateFields() -> Bool {
        // Trim whitespaces for inputs
        guard let email = self.emailTextField.text?.trimmingCharacters(in: .whitespaces),
              let password = self.passwordTextField.text?.trimmingCharacters(in: .whitespaces) else {
            showAlert(message: StringConstants.invalidInput)
            return false
        }

        // Validate email
        if !validateInput(email, validationType: .email) {
            showAlert(message: StringConstants.enterValidEmail)
            return false
        }

        // Validate password
        if !validateInput(password, validationType: .password) {
            showAlert(message: StringConstants.passwordValidation)
            return false
        }
        return true
    }
    /// Validates input based on the specified type.
    private func validateInput(_ input: String, validationType: ValidationType) -> Bool {
        switch validationType {
        case .email:
            return !input.isEmpty && input.isValidEmail()
        case .password:
            return !input.isEmpty && input.isValidPassword()
        }
    }
}

extension String {
    /// Checks if the string is a valid email.
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }

    /// Checks if the string is a valid password.
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,32}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
}
