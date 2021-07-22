//
//  ListCategoryViewController.swift
//  Kindney Failure
//
//  Created by Miftah Juanda Batubara on 16/07/21.
//

import UIKit

class ListCategoryViewController: UIViewController {

    @IBOutlet weak var collectionViewListCategory: UICollectionView!
    
    var sendDataList: DataItems!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setItemView()
        
    }
 
    func setItemView() {
        self.title = "\(sendDataList.nama!)"
        
        collectionViewListCategory.delegate = self
        collectionViewListCategory.dataSource = self
        let headerSearch = collectionViewListCategory.collectionViewLayout as? UICollectionViewFlowLayout
        headerSearch?.sectionHeadersPinToVisibleBounds = true
    }
    
}


extension ListCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataitems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellListCategory = collectionViewListCategory.dequeueReusableCell(withReuseIdentifier: "cellListCategory", for: indexPath) as! ListCategoryCollectionViewCell
        cellListCategory.setViewItem()
        cellListCategory.imageListCategory.image = UIImage(named: sendDataList.imageFav)
        cellListCategory.nameListCategory.text = sendDataList.nama
        
        cellListCategory.layer.cornerRadius = 20
        cellListCategory.layer.shadowColor = UIColor.lightGray.cgColor
        cellListCategory.layer.shadowOffset = CGSize(width: 0, height: 0)
        cellListCategory.layer.shadowRadius = 3.1
        cellListCategory.layer.shadowOpacity = 10.1
        cellListCategory.layer.masksToBounds = false
        cellListCategory.layoutIfNeeded()
        
        return cellListCategory
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailPageItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailPageItem") {
            let indexPath = collectionViewListCategory.indexPathsForSelectedItems!.first
//            let collectionViewDetail = segue.destination as? ListCategoryViewController
//            let selectItem = dataitems[indexPath!.row]
//
//            collectionViewDetail?.sendDataList = selectItem
            
            collectionViewListCategory.deselectItem(at: indexPath!, animated: true)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 130)
//    }
    
}

extension ListCategoryViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension ListCategoryViewController: UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView = UICollectionReusableView()
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let viewSearch = collectionViewListCategory?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "searchBarListCat", for: indexPath) as? ListSearchBarCollectionReusableView else { return reusableView }
            viewSearch.filterButton.addTarget(self, action: #selector(didTapMyButton(sender:)), for: .touchUpInside)
            
            return viewSearch
    
            } else {
                assert(false, "Unexpected element kind")
        }
        return reusableView
    }
    
    @objc func didTapMyButton(sender:UIButton!) {
        showFilterPage()
        print("Tapped it!")
    }
    
    @objc func showFilterPage() {
        let slideVC = FilterViewController()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
}
