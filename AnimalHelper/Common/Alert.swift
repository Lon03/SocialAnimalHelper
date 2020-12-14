//
//  Alert.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 03.12.2019.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import Foundation
import SwiftEntryKit



class Alert {
    
    static let shared = Alert()
    
    public func showErrorAler(
        title: String,
        desc: String,
        textColor: UIColor,
        imageName: String? = nil) {
        let title = EKProperty.LabelContent(
            text: title,
            style: .init(
                font: UIFont.systemFont(ofSize: 20, weight: .semibold),
                color: textColor            ),
            accessibilityIdentifier: "title"
        )
        let description = EKProperty.LabelContent(
            text: desc,
            style: .init(
                font: UIFont.systemFont(ofSize: 15, weight: .medium),
                color: textColor
            ),
            accessibilityIdentifier: "description"
        )
        var image: EKProperty.ImageContent?
        let simpleMessage = EKSimpleMessage(
            image: image,
            title: title,
            description: description
        )
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
        let contentView = EKNotificationMessageView(with: notificationMessage)
        SwiftEntryKit.display(entry: contentView, using: self.setupErrorPresets())
    }
    
    // Configs
    private func setupErrorPresets() -> EKAttributes{
        var attributes: EKAttributes

        attributes = .topFloat
        attributes.hapticFeedbackType = .success
        attributes.entryBackground = .gradient(
            gradient: .init(
                colors: [.red, .orange],
                startPoint: .zero,
                endPoint: CGPoint(x: 1, y: 1)
            )
        )
        attributes.popBehavior = .animated(
            animation: .init(
                translate: .init(duration: 0.3),
                scale: .init(from: 1, to: 0.7, duration: 0.7)
            )
        )
        attributes.shadow = .active(
            with: .init(
                color: .black,
                opacity: 0.5,
                radius: 10
            )
        )
        attributes.statusBar = .dark
        attributes.scroll = .enabled(
            swipeable: true,
            pullbackAnimation: .easeOut
        )
        attributes.positionConstraints.maxSize = .init(
            width: .constant(value: UIScreen.main.bounds.width),
            height: .intrinsic
        )
        return attributes
    }
}
