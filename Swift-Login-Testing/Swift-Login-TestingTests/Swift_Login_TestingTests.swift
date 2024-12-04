//
//  Swift_SwiftLoginTestingTests.swift
//  Swift-SwiftLoginTestingTests
//
//  Created by Saumil Shah on 27/11/24.
//

import Testing
@testable import Swift_Login_Testing
import UIKit

@MainActor
@Suite("LoginTest")
struct Swift_SwiftTestingTests {

    var loginVC: LoginViewController!

    init() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginVC = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() as? LoginViewController
        loginVC.loadViewIfNeeded()
    }
    
    @Test func loginWhenCreatedHasRequiredTextFieldsEmpty()  {
        // assign
        let emailTextField = loginVC?.emailTextField
        let passwordTextField = loginVC?.passwordTextField

        // expect
        #expect(emailTextField?.text == "", "Email text field was not empty when the view controller initially loaded")
        #expect(passwordTextField?.text == "", "Password text field was not empty when the view controller initially loaded")
        
        // check placeholder
        #expect(emailTextField?.placeholder == "Enter Email", "Email text field has Enter Email placeholder")
        #expect(passwordTextField?.placeholder == "Enter Password", "Password text field has Enter Email Password")
    }
    
    @Test func submitWhenCreatedHasSignInButtonAndAction() throws {
        // assign
        let signInButton: UIButton? = loginVC.signInButton
        let signInButtonActions = signInButton?.actions(forTarget: loginVC, forControlEvent: .touchUpInside)
        
        // expect
        #expect(signInButton?.titleLabel?.text == "Sign In", "Sign In button has Sign In Title")
        #expect(signInButtonActions?.count == 1, "Signin Button Actions Count Should Be 1")
        #expect(signInButtonActions?.first == "onSignInClick:", "There is no action with a name onSignInClick assigned to Signin button")
    }
    
    @Test func loginValidationWhenAllInputsAreProvidedShouldReturnTrue() {
        // assign
        loginVC?.emailTextField.text = "example@gmail.com"
        loginVC?.passwordTextField.text = "Test@123"
        let isValidationSuccess = loginVC.isValidateFields()

        // expect
        #expect(isValidationSuccess, "The isValidateFields should be TRUE for all valid inputs but returend FALSE")
    }
}
