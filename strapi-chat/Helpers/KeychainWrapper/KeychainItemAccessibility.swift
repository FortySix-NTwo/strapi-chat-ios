//
//  KeychainOptions.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//


import Foundation

protocol KeychainAttrRepresentable {
    var keychainAttrValue: CFString { get }
}

//  MARK:  @KeychainItemAccessibility
public enum KeychainItemAccessibility {

    @available(iOS 4, *)
    case afterFirstUnlock
    @available(iOS 4, *)
    case afterFirstUnlockThisDeviceOnly
    @available(iOS 4, *)
    case always
    @available(iOS 8, *)
    case whenPasscodeSetThisDeviceOnly
    @available(iOS 4, *)
    case alwaysThisDeviceOnly
    @available(iOS 4, *)
    case whenUnlocked
    @available(iOS 4, *)
    case whenUnlockedThisDeviceOnly
    
    static func accessibilityForAttributeValue(_ keychainAttrValue: CFString) -> KeychainItemAccessibility? {
        for (key, value) in keychainItemAccessibilityLookup {
            if value == keychainAttrValue {
                return key
            }
        }
        return nil
    }
}

private let keychainItemAccessibilityLookup: [KeychainItemAccessibility:CFString] = {
    var lookup: [KeychainItemAccessibility:CFString] = [
        .afterFirstUnlock: kSecAttrAccessibleAfterFirstUnlock,
        .afterFirstUnlockThisDeviceOnly: kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,
        .always: kSecAttrAccessibleAfterFirstUnlock,
        .whenPasscodeSetThisDeviceOnly: kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly,
        .alwaysThisDeviceOnly : kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,
        .whenUnlocked: kSecAttrAccessibleWhenUnlocked,
        .whenUnlockedThisDeviceOnly: kSecAttrAccessibleWhenUnlockedThisDeviceOnly
    ]

    return lookup
}()

extension KeychainItemAccessibility : KeychainAttrRepresentable {
    internal var keychainAttrValue: CFString {
        return keychainItemAccessibilityLookup[self]!
    }
}
