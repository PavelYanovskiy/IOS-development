//
//  PhotoCell.swift
//  HomeTask1_No_Storyboard
//
//  Created by Павел Яновский on 12.02.2024.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    
    // Каждая ячейка будет представлять из себя картинку, но ставим ставим иконку пользоватаеля 
    private var cellImage = UIImageView(image: UIImage(systemName: "person"))
    
    override init(frame: CGRect) { // CGRect - это тип, который позволяет выстроить X, Y, ширину и высоту
        
        super.init(frame: frame)
        
        setupUI()
        addConstraints()
    }
    
    // Обязательный инициализатор
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(cellImage)
    }
    
    private func addConstraints() {
        
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Растягиваем картинку на всю ширину и высоту ячейки
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImage.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ])
    }
}
