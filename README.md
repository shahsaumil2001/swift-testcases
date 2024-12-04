## swift-testcases
swift-testcases is an application designed to demonstrate test cases for a login page using XCTest and the Testing framework.

1. Swift-Login-Testing: The name implies that it showcases test cases for a login page using the Testing framework. 

2. Swift-Login-XCTest: The name suggests that it highlights test cases for a login page using the XCTest framework.

## Technology Stack
- Language: Swift

- Xcode Version: 16.0 and later

## Key Features
- Login UI.

- Testcases for login page using XCTest and Testing framework.

## Syntax of Testing Framework
```
    @Test func loginWhenCreatedHasRequiredTextFieldsEmpty()  {
        // assign
        let emailTextField = loginVC?.emailTextField

        // expect
        #expect(emailTextField?.text == "", "Email text field was not empty when the view controller initially loaded")
        
        // check placeholder
        #expect(emailTextField?.placeholder == "Enter Email", "Email text field has Enter Email placeholder")
    }
    
```

## Comparison between XCTest & Testing framework




## 📫 Reach me for any questions/suggestion :point_down::
[![LinkedInIcon](https://user-images.githubusercontent.com/56787966/180372874-fd85a898-5750-4b51-a39d-bf552e321eb4.png)](https://www.linkedin.com/in/saumil-shah-b954b9101/)

Please feel free to create pull request.

## License

swift-testcases is written in Swift and is open source.
