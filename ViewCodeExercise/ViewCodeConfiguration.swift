//
//  ViewCodeConfig.swift
//  ViewCodeExercise
//
//  Created by João Dall Agnol on 03/02/23.
//

import Foundation

protocol ViewCodeConfiguration {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCodeConfiguration {
    
    func configureViews() {
        
    }
    
    func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
    
}
