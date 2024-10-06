//
//  TimeConverterViewController.swift
//  Time-Zone-Converter
//
//  Created by Huy vu on 6/10/24.
//

import UIKit

class TimeConverterViewController: UIViewController {
    
    var timeModel: TimeModel?
    let timeConverterView = TimeConverterView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timeConverterView)
        timeConverterView.frame = view.bounds // Đặt kích thước cho view

        timeConverterView.datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }

    @objc private func dateChanged(_ sender: UIDatePicker) {
        timeModel = TimeModel(vietnamTime: sender.date)
        updateResultLabel()
    }

    private func updateResultLabel() {
        guard let model = timeModel else { return }
        timeConverterView.updateResultLabel(vietnamTime: model.vietnamTime, ukTime: model.ukTime)
    }
}
