//
//  NewfeatureCollectionViewController.swift
//  XLWB
//
//  Created by CoderZQ on 2019/9/26.
//  Copyright © 2019 CoderZQ. All rights reserved.
//

import UIKit

let reuseIdentifier = "NewfeatureCell"

class NewfeatureCollectionViewController: UICollectionViewController {
    
    private let pageCount = 4
    private var layout : UICollectionViewFlowLayout = NewfeatureLayout()
    
    init() {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(NewfeatureCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pageCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewfeatureCell
        
        cell.imageIndex = indexPath.item

        return cell
    }

}


private class NewfeatureCell: UICollectionViewCell {
    
    var imageIndex: Int = 0 {
        didSet{
            iconView.image = UIImage.init(named: "new_feature_\(imageIndex + 1)")
            
            if imageIndex == 3 {
                startButton.isHidden = false
                
                startButton.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
                UIView.animate(withDuration: 3.0, animations: {
                    self.startButton.transform = CGAffineTransform.identity
                })
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        
        contentView.addSubview(startButton)
        startButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(-30)
        }
        
        
    }
    
    private lazy var iconView = UIImageView()
    
    private lazy var startButton: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage.init(named: "new_feature_button"), for: UIControl.State.normal)
        btn.setBackgroundImage(UIImage.init(named: "new_feature_button_highlighted"), for: UIControl.State.highlighted)
        btn.addTarget(self, action: #selector(startBtnClick), for: UIControl.Event.touchUpInside)
        btn.isHidden = true
        return btn
    }()
    
    
    @objc func startBtnClick() {
        
    }
}


private class NewfeatureLayout: UICollectionViewFlowLayout {
    override func prepare() {
        itemSize = UIScreen.main.bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal
        
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.isPagingEnabled = true
    }
}
