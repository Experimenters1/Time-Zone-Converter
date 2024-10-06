//
//  TimeModel.swift
//  Time-Zone-Converter
//
//  Created by Huy vu on 6/10/24.
//

import Foundation

struct TimeModel {
    var vietnamTime: Date
    var ukTime: Date {
        return convertVietnamToUKTime(vietnamTime)
    }

    init(vietnamTime: Date) {
        self.vietnamTime = vietnamTime
    }

    private func convertVietnamToUKTime(_ date: Date) -> Date {
        let vietnamTimeZone = TimeZone(identifier: "Asia/Bangkok")!
        let ukTimeZone = TimeZone(identifier: "Europe/London")!

        let vietnamOffset = vietnamTimeZone.secondsFromGMT(for: date)
        let ukOffset = ukTimeZone.secondsFromGMT(for: date)

        let offsetDifference = ukOffset - vietnamOffset
        return date.addingTimeInterval(TimeInterval(offsetDifference))
    }
}

