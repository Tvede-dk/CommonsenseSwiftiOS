//
//  SimpleTableView.swift
//  commonsenseIos
//
//  Created by Kasper T on 20/06/2017.
//  Copyright © 2017 commonsense. All rights reserved.
//

import Foundation
import UIKit

protocol DelegationTableCell {
    associatedtype CellType: UITableViewCell

    var reuseIdentifier: String { get }
    var height: CGFloat { get }
    func renderTo(cell: CellType)
}

class DelegationTableView<T:DelegationTableCell>: NSObject, UITableViewDelegate, UITableViewDataSource {

    var data: [T] = []

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemAt(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: item.reuseIdentifier, for: indexPath)
        return cell
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return itemAt(indexPath).height
    }

    private func itemAt(_ indexPath: IndexPath) -> T {
        return data[indexPath.row]
    }
}
