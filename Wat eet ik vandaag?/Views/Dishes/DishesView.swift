//
//  DishesView.swift
//  Wat eet ik vandaag?
//
//  Created by Niels Beeuwkes on 14/04/2019.
//  Copyright © 2019 Niels Beeuwkes. All rights reserved.
//

import UIKit

final class DishesView: View {
    
    let tableView = UITableView()
    let cellHeight: CGFloat = 70
    let padding: CGFloat = 10
    
    var dishes: [Dish] = [Dish(name: "Bananensoep met ballen", id: 0, ingredients: ["", ""], procedure: "", rating: 3, picture: "", source: "")] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        tableView.frame = frame
        tableView.delegate = self
        tableView.dataSource = self
        addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DishesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension DishesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: DishCell?
        
        cell = tableView.dequeueReusableCell(withIdentifier: DishCell.identifier) as? DishCell
        
        if cell == nil {
            cell = DishCell()
        }
        
        let dish = dishes[indexPath.row]
        
        cell?.name = dish.name
        cell?.rating = dish.rating
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

// MARK: - Custom Dish cell
private class DishCell: UITableViewCell {
    static let identifier = "DISH"
    
    public var name: String = "" {
        didSet {
            nameLabel.text = name
        }
    }
    
    public var rating: Int = 0 {
        didSet {
            ratingLabel.text = "\(rating)"
        }
    }
    
    private let padding: CGFloat = 10
    private let nameLabel = UILabel()
    private let ratingLabel = UILabel()
    private let ratingImageView = UIImageView()
    
    init() {
        super.init(style: .default, reuseIdentifier: DishCell.identifier)
        
        ratingImageView.image = UIImage(named: "")
        addSubview(ratingImageView)
        
        ratingLabel.textColor = .black
        ratingLabel.textAlignment = .right
        addSubview(ratingLabel)
        
        nameLabel.textColor = .black
        nameLabel.textAlignment = .left
        addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        ratingImageView.frame = CGRect(x: frame.size.width - padding - 30, y: (frame.size.height - 30) / 2, width: 30, height: 30)
        ratingLabel.frame = CGRect(x: ratingImageView.frame.origin.x - (padding / 2) - 20, y: 0, width: 20, height: frame.size.height)
        nameLabel.frame = CGRect(x: padding, y: 0, width: ratingLabel.frame.origin.x - (padding*2), height: frame.size.height)
    }
}
