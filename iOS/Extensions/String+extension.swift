//
//  String+extension.swift
//  IntermediateTraining
//
//  Created by Mina Shehata on 11/1/18.
//  Copyright © 2018 Mina Shehata. All rights reserved.
//

import Foundation

extension String {
    
        // parse html text........
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }

    
    func encode() -> String? {
        let data = self.data(using: .nonLossyASCII, allowLossyConversion: true)!
        return String(data: data, encoding: .utf8)
    }
    
    func decode() -> String? {
        let data = self.data(using: .utf8)!
        return String(data: data, encoding: .nonLossyASCII)
    }
    
    var Localize: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func isEnglishPhoneNumber() -> String {
        var newPhone = self
        newPhone = newPhone.replacingOccurrences(of: "١", with: "1")
        newPhone = newPhone.replacingOccurrences(of: "٢", with: "2")
        newPhone = newPhone.replacingOccurrences(of: "٣", with: "3")
        newPhone = newPhone.replacingOccurrences(of: "٤", with: "4")
        newPhone = newPhone.replacingOccurrences(of: "٥", with: "5")
        newPhone = newPhone.replacingOccurrences(of: "٦", with: "6")
        newPhone = newPhone.replacingOccurrences(of: "٧", with: "7")
        newPhone = newPhone.replacingOccurrences(of: "٨", with: "8")
        newPhone = newPhone.replacingOccurrences(of: "٩", with: "9")
        newPhone = newPhone.replacingOccurrences(of: "٠", with: "0")
        return newPhone

    }
    
    func getDateFromString() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // cairo time zone.......
        return dateFormatter.date(from: self)
    }
    
    func getTimeFromString() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
//        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // cairo time zone.......
        return dateFormatter.date(from: self)
    }
    
    func getTimeFromReservationTime() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // cairo time zone.......
        return dateFormatter.date(from: self)
    }
    
    
    func getVoteTimeoutDateFromString() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // cairo time zone.......
        return dateFormatter.date(from: self)
    }
    func getVootlyDateFromString() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // cairo time zone.......
        return dateFormatter.date(from: self)
    }
    func getDateFromCurrentDay() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // cairo time zone......
        dateFormatter.locale = Language.currentLanguage().contains("ar") ?  Locale.init(identifier: "ar_EG") : Locale.init(identifier: "en_US")
        let dateString = dateFormatter.date(from: self)
        return dateString
    }

    
}

extension Date {
    func convertDateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    func getVedettaStringFromDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
//        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // cairo time zone.......
        return dateFormatter.string(from: self)
    }
    func getDayNameForReservation() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Language.currentLanguage().contains("ar") ?  Locale.init(identifier: "ar_EG") : Locale.init(identifier: "en_US")
        let dateString = dateFormatter.string(from: self)
        return dateString
    }

    func getStringFromDateAvailable() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // cairo time zone.......
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    func getStringFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd,MMM yyyy"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    
    func getStringFromTime() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateFormat = "hh:mm a"
        let timeString = dateFormatter.string(from: self)
        return timeString
    }
    
    func getReservationDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
