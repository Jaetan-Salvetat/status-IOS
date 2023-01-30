//
//  String.swift
//  Status
//
//  Created by Gaetan Salvi on 30/01/2023.
//

import Foundation

extension String {
    public func isEmail() -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")
        return predicate.evaluate(with: self)
    }
    
    public func isPassword() -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$")
        return predicate.evaluate(with: self)
    }
    
    public func isUsername() -> Bool { return self.isNotEmpty() }
    
    public func isNotEmpty() -> Bool { return !self.isEmpty }
}
