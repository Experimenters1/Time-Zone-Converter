//
//  TimeConverterView.swift
//  Time-Zone-Converter
//
//  Created by Huy vu on 6/10/24.
//

import UIKit

class TimeConverterView: UIView {
    
    let datePicker = UIDatePicker()
    let resultLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDatePicker()
        setupResultLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDatePicker()
        setupResultLabel()
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .dateAndTime
        datePicker.timeZone = TimeZone(identifier: "Asia/Bangkok") // Múi giờ Việt Nam
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupResultLabel() {
        resultLabel.numberOfLines = 0
        resultLabel.textAlignment = .center
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }

    func updateResultLabel(vietnamTime: Date, ukTime: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        let vietnamTimeString = dateFormatter.string(from: vietnamTime)
        let ukTimeString = dateFormatter.string(from: ukTime)
        
        resultLabel.text = "Thời gian ở Việt Nam: \(vietnamTimeString)\nThời gian ở UK: \(ukTimeString)"
    }
}
    
