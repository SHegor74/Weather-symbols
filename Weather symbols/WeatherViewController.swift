//
//  ViewController.swift
//  Weather symbols
//
//  Created by Egor Naberezhnov on 22.07.2024.
//
import UIKit

// MARK: - ViewController

class WeatherViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private var weatherImageView: UIImageView!
    private var currentWeather: WeatherSymbols = WeatherSymbols.allCases.randomElement()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupWeatherImageView()
        displayWeatherCondition(currentWeather)
    }
    
    
    private func displayWeatherCondition(_ condition: WeatherSymbols) {
        weatherImageView.image = UIImage(systemName: condition.rawValue)
        weatherImageView.tintColor = .systemBlue // Для отображения иконок, так как они системные
    }
    
    private func animateTransition(to condition: WeatherSymbols) {
        UIView.transition(with: weatherImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.displayWeatherCondition(condition)
        })
    }
}

// MARK: - setup Views

extension WeatherViewController {
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherCollectionViewCell.reusedId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupWeatherImageView() {
        weatherImageView = UIImageView()
        weatherImageView.contentMode = .scaleAspectFit
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(weatherImageView)
        
        NSLayoutConstraint.activate([
            weatherImageView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            weatherImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WeatherSymbols.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.reusedId, for: indexPath) as! WeatherCollectionViewCell
        let condition = WeatherSymbols.allCases[indexPath.item]
        cell.configure(with: condition)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension WeatherViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCondition = WeatherSymbols.allCases[indexPath.item]
        animateTransition(to: selectedCondition)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}


