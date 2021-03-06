//
//  File.swift
//  
//
//  Created by Sven A. Schmidt on 23/12/2019.
//

import ArgumentParser
import Foundation
import Path
import ShellOut


@discardableResult
public func shellOut(to command: ShellOutCommand, at path: Path) throws -> String {
    try shellOut(to: command, at: "\(path)", outputHandle: nil, errorHandle: nil)
}


extension ShellOutCommand {
    public static func openFile(at path: Path) -> ShellOutCommand {
        return ShellOutCommand(string: "open \(path)")
    }
}


extension Optional: CustomStringConvertible where Wrapped == String {
    public var description: String {
        switch self {
            case let .some(value): return value
            case .none: return "nil"
        }
    }

}


extension Path: ExpressibleByArgument {
    public init?(argument: String) {
        self.init(argument)
    }
}
