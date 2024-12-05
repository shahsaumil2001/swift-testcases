//
//  LoginViewControllerTests.swift
//  Swift-Login-XCTest
//
//  Created by Saumil Shah on 27/11/24.
//

import XCTest
@testable import Swift_Login_XCTest

class LoginViewControllerTests: XCTestCase {

    var loginVC: LoginViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginVC = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() as? LoginViewController
        loginVC.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginVC = nil
    }

    func testLogin_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        // Act
        let emailTextField = try XCTUnwrap(loginVC.emailTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(loginVC.passwordTextField, "The passwordTextField is not connected to an IBOutlet")

        // Assert
        XCTAssertEqual(emailTextField.text, "", "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "", "Password text field was not empty when the view controller initially loaded")
        
        // check placeholder
        XCTAssertEqual(emailTextField.placeholder, "Enter Email", "Email text field has Enter Email placeholder")
        XCTAssertEqual(passwordTextField.placeholder, "Enter Password", "Password text field has Enter Email Password")
    }
    
    func testSubmit_WhenCreated_HasSignInButtonAndAction() throws {
        // Arrange
        let signinButton: UIButton = try XCTUnwrap(loginVC.signInButton, "Signin button does not have a referencing outlet")

        // Act
        let signinButtonActions = try XCTUnwrap(signinButton.actions(forTarget: loginVC, forControlEvent: .touchUpInside), "Login button does not have any actions assigned to it")

        // Assert
        XCTAssertEqual(signinButton.titleLabel?.text, "Sign In", "Sign In button has Sign In Title")
        XCTAssertEqual(signinButtonActions.count, 1)
        XCTAssertEqual(signinButtonActions.first, "onSignInClick:", "There is no action with a name onSignInClick assigned to Signin button")
    }
    
    func testLoginValidation_WhenAllInputsAreProvided_ShouldReturnTrue() {
        // Arrange
        loginVC.emailTextField.text = "example@gmail.com"
        loginVC.passwordTextField.text = "Test@123"
        // Act
        let isValidationSuccess = loginVC.isValidateFields()

        // Assert
        XCTAssertTrue(isValidationSuccess, "The isValidateFields should be TRUE for all valid inputs but returend FALSE")
    }
}
