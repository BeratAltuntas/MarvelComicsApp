//
//  FavoriteCellFlowLayout.swift
//  Marvel Characters
//
//  Created by BERAT ALTUNTAŞ on 26.04.2022.
//

import UIKit

final class FavoriteCellFlowLayout: UICollectionViewFlowLayout {
	private var columnCount: Int
	private var heightRatio: CGFloat = (1.7 / 1.0)
	
	init(ColumnCount:Int, MinColumnSpace:CGFloat = 15, MinRowSpace:CGFloat = 15) {
		
		self.columnCount = ColumnCount
		super.init()
		minimumInteritemSpacing = MinColumnSpace
		minimumLineSpacing = MinRowSpace
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepare() {
		super.prepare()
		
		guard let collView = collectionView else{return}
		
		let spaces = collView.safeAreaInsets.left + collView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(columnCount - 1)
		
		let itemWidth = ((collView.bounds.size.width - spaces) / CGFloat(columnCount)).rounded(.down)
		let itemHeight = itemWidth * heightRatio
		
		itemSize = CGSize(width: itemWidth, height: itemHeight)
	}
}
