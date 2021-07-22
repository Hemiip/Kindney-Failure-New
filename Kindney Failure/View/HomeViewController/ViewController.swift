//
//  ViewController.swift
//  Kindney Failure
//
//  Created by Miftah Juanda Batubara on 07/07/21.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var collectionViewRecomendation: UICollectionView!
    @IBOutlet weak var collectionViewCategory: UICollectionView!
    @IBOutlet weak var viewHomePage: UIView!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    
    let pagerViewMaxHeight = 350
    var previousOffsetState: CGFloat = 0
    var searching = false
    
    private var lastContentOffset: CGFloat = 0
    private var parentTopViewcontraints: CGFloat = 0
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(collectionViewCategory)
        setItemView()
        
    }
    
    func setItemView() {
        collectionViewRecomendation.delegate = self
        collectionViewRecomendation.dataSource = self
        collectionViewCategory.delegate = self
        collectionViewCategory.dataSource = self
        
        let headerSearch = collectionViewCategory.collectionViewLayout as? UICollectionViewFlowLayout
        headerSearch?.sectionHeadersPinToVisibleBounds = true
        
    }
    
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //set when action user searching data
        if searching {
            return dataSearch.count
        }
        else {
            //set for showing total data in Category
            if (collectionView == collectionViewCategory) {
                return dataitems.count
            }
            //set for showing total data in Recomendation
            return dataRecomendation.count
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //setDataCollectionRecomendation
        let cellRecomendation = collectionViewRecomendation.dequeueReusableCell(withReuseIdentifier: "cellRecomendation", for: indexPath) as! RecomendationCollectionViewCell
        cellRecomendation.setupData(data: dataRecomendation[indexPath.row])
        cellRecomendation.layer.cornerRadius = 15
        cellRecomendation.setView()
        
        //setDataCollectionCategory
        if (collectionView == collectionViewCategory) {
            let cellCategory = collectionViewCategory.dequeueReusableCell(withReuseIdentifier: "cellCategory", for: indexPath) as! CategoryCollectionViewCell
            if searching {
                cellCategory.setupDataCategory(data: dataSearch[indexPath.row])
            }
            else {
                cellCategory.setupDataCategory(data: dataitems[indexPath.row])
            }
            cellCategory.setupView()
            cellCategory.layer.cornerRadius = 20
            cellCategory.layer.shadowColor = UIColor.lightGray.cgColor
            cellCategory.layer.shadowOffset = CGSize(width: 0, height: 0)
            cellCategory.layer.shadowRadius = 3.1
            cellCategory.layer.shadowOpacity = 10.1
            cellCategory.layer.masksToBounds = false
            cellCategory.layoutIfNeeded()
            
            return cellCategory
        }
        return cellRecomendation
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (collectionView == collectionViewCategory) {
            return CGSize(width: 170, height: 235)
        }
        
        return CGSize(width: 340, height: 155)
    }
    
}



extension ViewController: UISearchBarDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        setPosition(scrollView)
    }

    func setPosition(_ scrollView:UIScrollView) {

        print("Ini Offset : \(scrollView.contentOffset.y)")
        if scrollView.contentOffset.y >= 50 {
            self.viewHeightConstraint.constant = 0// set position till want to hide view
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }else if scrollView.contentOffset.y <= 50 {
            self.viewHeightConstraint.constant = 200 //set back view
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    //Handle header in collectionview
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView = UICollectionReusableView()
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let viewSearch = collectionViewCategory?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "searchBar", for: indexPath) as? SearchBarCollectionReusableView else { return reusableView }
            
            viewSearch.adjustSearchButton.addTarget(self, action: #selector(didTapMyButton(sender:)), for: .touchUpInside)
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dataitems.removeAll()
        let item = searchBar.text!.lowercased()
        print("Inii adalah : \(item)")
        for items in dataSearch {
            
            if (items.nama.lowercased().contains(item)) {
                dataitems.append(items)
            }
        }
        
        if (item.isEmpty) {
            dataitems = dataSearch
        }
        self.collectionViewCategory.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if searching {
            print("INI Item : \(dataSearch[indexPath.row].nama)")
        }
        
        if (collectionView == collectionViewCategory) {
            print("INI CAtegory : \(dataitems[indexPath.row].nama)")
            self.performSegue(withIdentifier: "listCategoryItem", sender: self)
        }
        
        if (collectionView == collectionViewRecomendation) {
            print("INI Recomendation : \(dataRecomendation[indexPath.row].nama)")
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "listCategoryItem") {
            let indexPath = collectionViewCategory.indexPathsForSelectedItems!.first
            let collectionViewDetail = segue.destination as? ListCategoryViewController
            let selectItem = dataitems[indexPath!.row]
            
            collectionViewDetail?.sendDataList = selectItem
            
            collectionViewCategory.deselectItem(at: indexPath!, animated: true)
        }
    }
    
//    func updateSearchResults(for searchController: UISearchController) {
//        print("Cekkk data")
//        dataitems.removeAll()
//
//        if searchController.searchBar.text == nil || searchController.searchBar.text == "" {
//            print("Nilai Kosonggg")
//            searching = false
//            view.endEditing(true)
//            collectionViewCategory.reloadData()
//        }
//        else {
//            searching = true
//            let nilai = searchController.searchBar.text!
//
//            for items in dataSearch {
//                if items.nama.lowercased().contains(nilai.lowercased()) {
//
////                if items.nama.range(of: nilai) != nil {
//                    dataitems.append(items)
//                    print("data ada \(items)")
//                }
//
//            }
//            print("Nilai adaa \(nilai)")
//        }
//        collectionViewCategory.reloadData()
//    }
    
}
