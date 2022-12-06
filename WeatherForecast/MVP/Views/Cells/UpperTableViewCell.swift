//
//  UpperTableViewCell.swift
//  WeatherForecast
//
//  Created by Artyom Beldeiko on 4.12.22.
//

import UIKit

class UpperTableViewCell: UITableViewCell {
    
    static let identifier = "UpperTableViewCell"
   
    var data: WeatherData?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(WeatherPerDayCollectionViewCell.self, forCellWithReuseIdentifier: WeatherPerDayCollectionViewCell.identifier)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension UpperTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherPerDayCollectionViewCell.identifier, for: indexPath) as? WeatherPerDayCollectionViewCell else { return UICollectionViewCell() }
        
        if let data = data {
            cell.timeStampLabel.text = data.weatherPerDay[indexPath.row].timestamp
            cell.weatherType.image = data.weatherPerDay[indexPath.row].weatherTypeIcon
            cell.temperatureLabel.text = data.weatherPerDay[indexPath.row].temperature
            
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.weatherPerDay.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 51, height: 90.03)
    }
    
}
