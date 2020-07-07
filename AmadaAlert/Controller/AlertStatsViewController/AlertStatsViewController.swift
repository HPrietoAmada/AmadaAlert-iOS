//
//  AlertViewController.swift
//  AmadaAlert
//
//  Created by IT Support on 7/9/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit
import Charts

class AlertStatsViewController: UIViewController {

    let headerID: String = "alert-header-id"
    let footerID: String = "alert-footer-id"
    let cellID: String = "alert-cell-id"

    var responseTypes = [PieChartDataEntry]()

    var RESPONSES = [AlertResponse]()

    let colors = [
        UIColor.MainColors.darkGray,
        UIColor.MainColors.mainColor,
        UIColor.red,
        UIColor.MainColors.lightColor,
        UIColor.orange
    ]

    let scrollView: ScrollView = {
        let scrollView = ScrollView()
        return scrollView
    }()

    let alertTitleView: TitleView = {
        let titleView = TitleView("Alert Name", subtitle: "Created By: Heriberto")
        return titleView
    }()

    let responseChartView: PieChartView = {
        let pieChartView = PieChartView(frame: CGRect.zero)
        pieChartView.centerText = "Alert Response Stats"
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        return pieChartView
    }()

    let responseTableView: TableView = {
        let tableView = TableView()
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)
        return tableView
    }()

    lazy var closeNavbarButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(image: UIImage(named: "left_navbar_arrow"), style: .plain, target: self, action: #selector(handleClose))
        return item
    }()

    @objc func handleClose() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupChart()
        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        var response1 = AlertResponse()
        response1.responseDesc = "Safe"

        var response2 = AlertResponse()
        response2.responseDesc = "Not Safe"

        var response3 = AlertResponse()
        response3.responseDesc = "No Response"

        RESPONSES = [
            response1,
            response2,
            response3
        ]

        setupChart()
        responseTableView.reloadData()
    }

    func setupChart() {
        responseChartView.delegate = self

        responseTypes.removeAll()

        RESPONSES.forEach { (response) in
            let responseValue = 100 / (Double(responseTypes.count) + 1.0)
            let responseEntry = PieChartDataEntry(value: responseValue)
            responseEntry.label = response.responseDesc
            responseEntry.x = Double(response.id ?? 0)
            responseTypes.append(responseEntry)
        }

        updateResponseChart()
    }

    func updateResponseChart() {
        let chartDataSet = PieChartDataSet(entries: responseTypes, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)

        chartDataSet.colors = colors

        responseChartView.data = chartData
    }

    func setup() {
        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(alertTitleView)
        scrollView.addSubview(responseChartView)
        scrollView.addSubview(responseTableView)

        let responseChartDims: CGFloat = view.bounds.width - 40
        //let tableViewHeight: CGFloat = CGFloat(RESPONSES.count * 50) + CGFloat(RESPONSES.count * 3 * 60) + 150
        //let scrollViewHeight: CGFloat = responseChartDims + 80 + tableViewHeight
        let scrollViewHeight: CGFloat = view.bounds.height * 1.5

        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.bounds.width, height: scrollViewHeight)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        alertTitleView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        alertTitleView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        alertTitleView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40).isActive = true

        responseChartView.topAnchor.constraint(equalTo: alertTitleView.bottomAnchor, constant: 20).isActive = true
        responseChartView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        responseChartView.widthAnchor.constraint(equalToConstant: responseChartDims).isActive = true
        responseChartView.heightAnchor.constraint(equalToConstant: responseChartDims).isActive = true
        
        responseTableView.topAnchor.constraint(equalTo: responseChartView.bottomAnchor, constant: 10).isActive = true
        responseTableView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        responseTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        responseTableView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true

        navigationItem.leftBarButtonItem = closeNavbarButtonItem
    }
}
