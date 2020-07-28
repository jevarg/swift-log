//
//  Log.swift
//  swift-log
//
//  Created by Jean on 28/07/2020.
//  Copyright © 2020 Jean Gravier. All rights reserved.
//

import Foundation

open class Log {
    public enum MessageType: String {
        case debug = "🗻"
        case warning = "⚠️"
        case error = "🚫"
    }

    private static func log(_ whatever: Any, type: MessageType, file: String, line: Int) {
        let filename: String

        if let substring = file.split(separator: "/").last {
            filename = String(substring)
        } else {
            filename = file
        }

        print("\(type.rawValue) \(filename):\(line) -", whatever)
    }

    public static func debug(_ whatever: Any, file: String = #file, line: Int = #line) {
        #if DEBUG
        log(whatever, type: .debug, file: file, line: line)
        #endif
    }

    public static func warning(_ whatever: Any, file: String = #file, line: Int = #line) {
        log(whatever, type: .warning, file: file, line: line)
    }

    public static func error(_ whatever: Any, file: String = #file, line: Int = #line) {
        log(whatever, type: .error, file: file, line: line)
    }
}
