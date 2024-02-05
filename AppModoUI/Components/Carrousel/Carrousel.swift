//
//  TestCarrousel.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 24/01/2024.
//

import UIKit

@objc protocol HorizontalCarrouselProtocol {
    
    @objc func updateCarrousel(notification: Notification)
    
}

class Carrousel: UIView {
    
    private var carrouselElements: [UIView] = []
    private var elementsSize: CGSize?
    private var spaceBetween: CGFloat?
    private var initialPadding: CGFloat?
    private var scrollDirection: UICollectionView.ScrollDirection?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CarrouselCell.self, forCellWithReuseIdentifier: CarrouselCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false

        return collectionView
    }()
    
    init(carrouselElements: [UIView], elementsSize: CGSize, spaceBetween: CGFloat, initialPadding: CGFloat, axis: UICollectionView.ScrollDirection = .horizontal){
        super.init(frame: .zero)
        
        self.carrouselElements = carrouselElements
        self.elementsSize = elementsSize
        self.spaceBetween = spaceBetween
        self.initialPadding = initialPadding
        self.scrollDirection = axis
        self.configure()
    
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = axis
        }
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData(carrouselElements: [UIView]){
        self.carrouselElements = carrouselElements
        collectionView.reloadData()
    }
    
    private func configure(){
        self.backgroundColor = .white
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: initialPadding ?? 20, bottom: scrollDirection == .vertical ? 95 : 0, right: 20)
        
      
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

extension Carrousel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.carrouselElements.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarrouselCell.identifier, for: indexPath) as? CarrouselCell else {
            fatalError("Error when dequeue cell")
        }
        let newCell = self.carrouselElements[indexPath.row]
        
        cell.configure(cellContent: newCell)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: scrollDirection == .horizontal ? elementsSize!.width : collectionView.bounds.size.width,
                      height: scrollDirection == .vertical ? elementsSize!.height : collectionView.bounds.height)
    }
    
    //Horizontal
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return spaceBetween ?? 10
    }
    
    
}
