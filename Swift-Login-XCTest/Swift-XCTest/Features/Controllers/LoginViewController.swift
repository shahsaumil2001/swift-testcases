//
//  LoginViewController.swift
//  Swift-Login-XCTest
//
//  Created by Saumil Shah on 27/11/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets -
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions -
    @IBAction func onSignInClick(_ sender: Any) {
        guard isValidateFields() else { return }
        // Success
        self.showAlert(message: StringConstants.success)
    }
    // MARK: - Helper -
    /// Displays an alert message.
    func showAlert(message: String) {
        Alert.showAlert(message: message, alertCompletion: { _ in })
    }
}
