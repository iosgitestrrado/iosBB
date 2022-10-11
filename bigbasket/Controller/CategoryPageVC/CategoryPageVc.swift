//
//  CategoryPageVc.swift
//  bigbasket
//
//  Created by Deepu S on 05/09/22.
//

import UIKit

class CategoryPageVc: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categoryTitle: UILabel!

//    private var categoryList = [CategoryModel]()
//    private var subCategoryList = [SubCategoryModel]()
    private var selectedCatgoryIndex = -1
    
    private var gridWidth: CGFloat = 124.0
    private let gridHeight: CGFloat = 154.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gridWidth = (self.collectionView.frame.size.width / 2.0) - 16
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: gridWidth, height: gridHeight)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
        collectionView.alwaysBounceVertical = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.getCategories()
        self.navigationController?.isNavigationBarHidden = true
    }

    private func selectCategory(_ row: Int) {
//        subCategoryList = categoryList[row].Subcategories
//        categoryTitle.text = categoryList[row].Name
        selectedCatgoryIndex = row
        self.tableView.reloadData()
        self.collectionView.reloadData()
    }
}

// MARK: - API Section
extension CategoryPageVc {
    private func getCategories() {
        /*if !Reachability.isConnectedToNetwork() {
            Toast.show()
            return
        }
        Core.ShowProgress(self, detailLbl: "")
        CategoryClient.get("0") { [self] response in
            if let data = response, data.count > 0 {
                categoryList = data
                selectCategory(0)
            }
            Core.HideProgress(self)
        }*/
    }
}

// MARK: - UITableViewDataSource -
extension CategoryPageVc: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0// categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*if let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell {
            cell.configure(categoryList[indexPath.row], isSelectedRow: selectedCatgoryIndex == indexPath.row)
            return cell
        }*/
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate -
extension CategoryPageVc: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       /* subCategoryList = categoryList[indexPath.row].Subcategories
        categoryTitle.text = categoryList[indexPath.row].Name
        selectedCatgoryIndex = indexPath.row
        self.tableView.reloadData()
        self.collectionView.reloadData()*/
    }
}


// MARK: - UICollectionViewDataSource -
extension CategoryPageVc: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0// subCategoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       /* if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell {
            cell.configure(subCategoryList[indexPath.row])
            return cell
        }*/
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate -
extension CategoryPageVc: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - UICollectionViewDelegateFlowLayout -
extension CategoryPageVc: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: gridWidth, height: gridHeight)
    }
}
