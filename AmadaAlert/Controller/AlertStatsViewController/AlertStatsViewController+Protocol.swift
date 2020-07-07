//
//  AlertViewController+Protocol.swift
//  AmadaAlert
//
//  Created by IT Support on 7/9/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit
import Charts

extension AlertStatsViewController: ChartViewDelegate, UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }

    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
}
