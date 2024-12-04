## swift-testcases
swift-testcases is an two application designed to demonstrate test cases for a login page using XCTest and the Testing framework.

1. Swift-Login-Testing: The name implies that it showcases test cases for a login page using the Testing framework. 

2. Swift-Login-XCTest: The name suggests that it highlights test cases for a login page using the XCTest framework.

## Technology Stack
- Language: Swift

- Xcode Version: 16.0 and later

## Key Features
- Login UI.

- Testcases for login page using XCTest and Testing framework.

## Syntax of Testing Framework

Example of test case of **Sign in button attached with action**
```
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
    
```

## Comparison between XCTest & Testing framework

<img width="655" alt="Screenshot 2024-12-04 at 7 27 42 PM" src="https://github.com/user-attachments/assets/6cbd5025-d38a-4e24-9449-c50ec4f47cc4">

## 📫 Reach me for any questions/suggestion :point_down::
[![LinkedInIcon](https://user-images.githubusercontent.com/56787966/180372874-fd85a898-5750-4b51-a39d-bf552e321eb4.png)](https://www.linkedin.com/in/saumil-shah-b954b9101/)

Please feel free to create a pull request.

## License

swift-testcases is written in Swift and is open source.
