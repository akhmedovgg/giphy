//
//  TagsCollectionView.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 29/01/23.
//

import UIKit
import PinLayout

class TagsCollectionView: View {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(TagCollectionCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return collectionView
    }()
    
    override func setupAppearance() {
        backgroundColor = R.color.eerieBlack()
    }
    
    override func setupViewHierarchy() {
        addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setupLayout() {
        collectionView.pin.all()
    }
}

extension TagsCollectionView: UICollectionViewDelegate {
    
}

extension TagsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = TagCollectionCell(frame: CGRect(x: 0, y: 0, width: 0, height: 32))
        return cell.sizeThatFits(cell.bounds.size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension TagsCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TagCollectionCell
        
        return cell
    }
}
