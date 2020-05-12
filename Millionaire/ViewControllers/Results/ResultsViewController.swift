//
//  ResultsViewController.swift
//  Millionaire
//
//  Created by Maxim Timokhin on 28/10/2019.
//  Copyright © 2019 GetProger. All rights reserved.
//

import UIKit
import PinLayout

class ResultsViewController: BaseViewController {

    var results: [Result]? {
        didSet {
            reloadData()
        }
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()
    
    private let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addSubviews()
        self.reloadData()
        title = "Results"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ResultCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: SubViews
    
    func addSubviews(){
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    // MARK: Layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.pin.all(view.pin.safeArea)
    }
    
    //MARK: Reload
    
    func reloadData(){
        guard let _ = results else {return}
        tableView.reloadData()
    }
    
}


extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // @todo separate dataSource
        guard let results = results else {return 0}
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell" , for: indexPath)
        
        guard let results = results else {return cell}
        
        let result = results[indexPath.row]
        
        cell.backgroundColor = .white
        cell.textLabel?.text = String(format: "$%d", result.amount)
        cell.textLabel?.textColor = .black;
        formatter.dateFormat = "MM.dd.yyyy 'at' HH:mm"
        cell.detailTextLabel?.text = formatter.string(from: result.date)
        cell.detailTextLabel?.textColor = .black
        return cell
    }
    
    
    
    
}
