//
//  UITableView+Extension.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

extension IndexPath {
    static func fromRow(_ row: Int) -> IndexPath {
        return IndexPath(row: row, section: 0)
    }
}

extension UITableView {
    func applyChanges(deletions: [Int], insertions: [Int], updates: [Int]) {
        beginUpdates()
        deleteRows(at: deletions.map(IndexPath.fromRow), with: .automatic)
        insertRows(at: insertions.map(IndexPath.fromRow), with: .automatic)
        reloadRows(at: updates.map(IndexPath.fromRow), with: .automatic)
        endUpdates()
    }
}

extension UIViewController {
    
    final func setupViewBackgroundView() {
        let gradiant = UIViewX()
        gradiant.gradiant_horizontal()
        view.addSubview(gradiant)
        gradiant.fillSuperView()
    }
    
   
    
}
extension UITableViewController {
    
    final func setupTableViewBackgroundView() {
        let gradiant = UIViewX()
        gradiant.gradiant_horizontal()
        tableView.backgroundView = gradiant
        tableView.separatorStyle = .none
    }
    
    final func add_black_header() {
        let hv = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        hv.backgroundColor = .clear
        tableView.tableHeaderView = hv
    }
    
}
extension UICollectionViewController {
    
    final func setupCollectionViewBackgroundView() {
        let gradiant = UIViewX()
        gradiant.gradiant_horizontal()
        collectionView.backgroundView = gradiant
//        collectionView.separatorStyle = .none
    }
    
    
}

extension UICollectionView {
    func scrollToNearestVisibleCollectionViewCell() -> IndexPath? {
        self.decelerationRate = UIScrollView.DecelerationRate.fast
        let visibleCenterPositionOfScrollView = Float(self.contentOffset.x + (self.bounds.size.width / 2))
        var closestCellIndex = -1
        var closestDistance: Float = .greatestFiniteMagnitude
        for i in 0..<self.visibleCells.count {
            let cell = self.visibleCells[i]
            let cellWidth = cell.bounds.size.width
            let cellCenter = Float(cell.frame.origin.x + cellWidth / 2)
            
            // Now calculate closest cell
            let distance: Float = fabsf(visibleCenterPositionOfScrollView - cellCenter)
            if distance < closestDistance {
                closestDistance = distance
                closestCellIndex = self.indexPath(for: cell)!.row
            }
        }
        if closestCellIndex != -1 {
            self.scrollToItem(at: IndexPath(row: closestCellIndex, section: 0), at: .centeredHorizontally, animated: true)
            return IndexPath(row: closestCellIndex, section: 0)
        }
        return nil
    }
}
