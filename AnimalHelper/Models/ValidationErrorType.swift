//
//  ValidationErrorType.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 12/1/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import Foundation
import Validator

struct ExampleValidationError: ValidationError {
    
    let message: String
    
    public init(_ message: String) {
        
        self.message = message
    }
}
