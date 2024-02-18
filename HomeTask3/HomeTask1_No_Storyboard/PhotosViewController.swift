//
//  PhotosViewController.swift
//  HomeTask1_No_Storyboard
//
//  Created by Павел Яновский on 12.02.2024.
//

import UIKit

final class PhotosViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        title = "Photos"
        
        // Настраиваем переиспользование ячеек, чтобы система не создавала заново каждый раз новую ячейку, иначе будут проблемы с памятью. Система создаст новые ячейки для тех элементов, которые помещаются на экране и те, которые доступны при быстром скролле, а потом система начнёт переисползовать их для следующих ячеек.
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "cell") // Вместо "cell" можно любой набор символов
    }
    
    // Количество ячеек
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    // Саму ячеку определяем в отдельном классе PhotoCell в отдельном файле
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      
        // Проверяем, а точно ли ячейка, полученная через dequeueReusableCell, имеет нужный нам тип - PhotoCell.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}


// Устанавливаем размеры фотографий
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        let cellSize = width / 2 - 25
        return CGSize(width: cellSize, height: cellSize)
    }
}
