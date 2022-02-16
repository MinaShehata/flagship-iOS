//
//  XCTest+Extension.swift
//  MeinVodafoneTests
//
//  Created by Mina Sheheta on 8/30/20.
//  Copyright © 2020 Mina Shehata. All rights reserved.
//

import Foundation
import XCTest

extension XCTest {
    #warning("To be ennhanced to use XCTIssue, once Xcode 12 is adopted")
    func constructModelFromJSONFile<T: Decodable>(named fileName: String, file: StaticString = #file, line: UInt = #line) throws -> T {
        let path = try XCTest.path(for: fileName, ofType: "json", fromBundle: Bundle(for: type(of: self)))
        let pathURL = URL(fileURLWithPath: path)
        let data: Data
        do {
            data = try Data(contentsOf: pathURL)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let model = try decoder.decode(T.self, from: data)
            
            return model
        } catch let decodingError as DecodingError {
            let mockModelError = MockModelError.failedToParseModel(type: "\(T.self)", fileName: fileName, error: decodingError)
            XCTFail("\(mockModelError)", file: file, line: line)
            throw mockModelError
        } catch {
            let mockModelError = MockModelError.failedToReadFileContents(fileName: fileName, error: error)
            XCTFail("\(mockModelError)", file: file, line: line)
            throw mockModelError
        }
    }


    static func path(for resource: String, ofType type: String, fromBundle bundle: Bundle, file: StaticString = #file, line: UInt = #line) throws -> String {
        guard let filePath = bundle.path(forResource: resource, ofType: type) else {
            let cmsError = FileError.fileNotFound(fileName: resource)
            XCTFail("\(cmsError)", file: file, line: line)
            throw cmsError
        }
        return filePath
    }

    enum MockModelError: Error, LocalizedError {
        case failedToReadFileContents(fileName: String, error: Error)
        case failedToParseModel(type: Decodable, fileName: String, error: Error)

        var errorDescription: String? {
            switch self {
                case let .failedToReadFileContents(fileName, error):
                    return "failedToReadFileContents(fileName: \(fileName), error: \(error)"
                case let .failedToParseModel(type, fileName, error):
                    return "failedToParseModel(type: \(type), fileName: \(fileName), error: \(error)"
            }
        }
    }

    enum FileError: Error, LocalizedError {
        case fileNotFound(fileName: String)

        var errorDescription: String? {
            switch self {
                case let .fileNotFound(fileName):
                    return "fileNotFound(fileName: \(fileName)"
            }
        }
    }
}
