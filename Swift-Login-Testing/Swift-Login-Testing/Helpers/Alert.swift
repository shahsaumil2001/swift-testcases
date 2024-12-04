//
//  DAlert.swift
//  Swift-Login-XCTest
//
//  Created by Saumil Shah on 27/11/24.
//

import UIKit

typealias AlertOkCompletion = (_ okPressed: Bool) -> Void

final class Alert {
    private init() {}
    
    /// Displays an alert with a title, message, and completion handler for the "OK" action.
    static func showAlert(
        title: String = StringConstants.appName,
        message: String,
        alertCompletion: @escaping AlertOkCompletion
    ) {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {
            return
        }
        
        // Create the alert controller
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add "OK" action with completion callback
        let okAction = UIAlertAction(title: StringConstants.okay, style: .default) { _ in
            alertCompletion(true)
        }
        okAction.setValue(UIColor.black, forKey: "titleTextColor") // Customize "OK" button color
        
        alert.addAction(okAction)
        
        // Present the alert on the main thread
        DispatchQueue.main.async {
            rootViewController.present(alert, animated: true)
        }
    }
}

extension UIApplication {
    /// Safely retrieves the current key window for the active scene.
    var keyWindow: UIWindow? {
        connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}
