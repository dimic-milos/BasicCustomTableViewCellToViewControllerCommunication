//
//  MasterViewController.swift
//  BasicCustomTableViewCellToViewControllerCommunication
//
//  Created by Milos Dimic on 9/25/18.
//  Copyright © 2018 Milos Dimic. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Init methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }

    // MARK: - Private methods
    
    private func registerCells() {
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
}

// MARK: - UITableViewDataSource

extension MasterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.delegate = self
        cell.buttonMain.setTitle(String(indexPath.row), for: .normal)
        return cell
    }
}

// MARK: CustomTableViewCellDelegate

extension MasterViewController: CustomTableViewCellDelegate {
    
    func didTapimageViewMain(inCell cell: CustomTableViewCell) {
        if let tableView = cell.superview as? UITableView {
            let index = tableView.indexPath(for: cell)
            if let indexPathRow = index?.row {
                print("didTapimageViewMain from cell at index: \(indexPathRow)")
            }
        }
    }
    
    func didTapButtonMain(inCell cell: CustomTableViewCell) {
        if let tableView = cell.superview as? UITableView {
            let index = tableView.indexPath(for: cell)
            if let indexPathRow = index?.row {
                print("didTapButtonMain from cell at index: \(indexPathRow)")
            }
        }
    }
}
