//
//  Utils.swift
//  CleanMVVMExercise
//
//  Created by Song on 2020-04-09.
//  Copyright © 2020 Song. All rights reserved.
//

import Foundation

func stringToDate(dateString: String) -> Date? {
    let dateFormatter = DateFormatter()
    let dateAndTime = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZ"
    dateFormatter.dateFormat = dateAndTime
    let date = dateFormatter.date(from: dateString)
    return date
}

func dateToReadableString(date: Date) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .short
    dateFormatter.doesRelativeDateFormatting = true
    let readableString = dateFormatter.string(from: date)
    return readableString
}
