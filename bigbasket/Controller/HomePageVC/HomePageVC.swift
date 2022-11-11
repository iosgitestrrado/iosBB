

import UIKit
import SDWebImage
import Alamofire

@available(iOS 13.0, *)
class HomePageVC: UIViewController {
    
    @IBOutlet weak var category_productsLabel: UILabel!
    
    @IBOutlet weak var second_categoryLabel: UILabel!
    @IBOutlet weak var first_categoryLabel: UILabel!
    @IBOutlet weak var page: UIPageControl!
    @IBOutlet weak var mainPageControl2: UIPageControl!
    @IBOutlet weak var BottomBannerCollectionView: UICollectionView!
    @IBOutlet weak var bottomBannerBackView: UIView!
    @IBOutlet weak var CenterBannerBackView: UIView!
    @IBOutlet weak var CenterBannerCollectionView: UICollectionView!
    @IBOutlet weak var ExploreProductsCollectionView: UICollectionView!
    
    @IBOutlet weak var BeverageProductsCollectionView: UICollectionView!
    @IBOutlet weak var BeverageProductsBackView: UIView!
    @IBOutlet weak var FeaturedProductsCollectionView: UICollectionView!
    @IBOutlet weak var FeaturedProductsBackView: UIView!
    @IBOutlet weak var GroceryCollectionView: UICollectionView!
    @IBOutlet weak var GroceryBackView: UIView!
    @IBOutlet weak var NewArrivalsCollectionView: UICollectionView!
    @IBOutlet weak var newArrivalsBackView: UIView!
    @IBOutlet weak var FruitAndVegsCollectionView: UICollectionView!
    @IBOutlet weak var FruitAndVegsBackView: UIView!
    @IBOutlet weak var RecommendedItemsCollectionView: UICollectionView!
    @IBOutlet weak var RecommendedItemsBackView: UIView!
    @IBOutlet weak var TreandingNowCollectionView: UICollectionView!
    @IBOutlet weak var TreandingBackView: UIView!
    @IBOutlet weak var BrandMustTryBackView: UIView!
    @IBOutlet weak var BrandMustTryCollectionView: UICollectionView!
    @IBOutlet weak var TopOfferBackView: UIView!
    @IBOutlet weak var TopOfferPageControl: UIPageControl!
    @IBOutlet weak var TopOfferBannerCollectionView: UICollectionView!
    @IBOutlet weak var ShopByCategoryBackView: UIView!
    @IBOutlet weak var HomeCategoryCollectionView: UICollectionView!
    @IBOutlet weak var mainBannerCollectionView: UICollectionView!
    @IBOutlet weak var mainBanerBackView: UIView!
    @IBOutlet weak var searchBackView: UIView!
    @IBOutlet weak var mainPageControl: UIPageControl!
    @IBOutlet weak var mainBanerImageView: UIImageView!
    
    @IBOutlet weak var backViewGrocery: UIView!
    var MainBanner = [Main_banner]();
    var CenterOfferBanner = [Center_offer_banner]();
    var BottomOfferBanner = [Bottom_offer_banner]();
    var HomeCategory = [Category]();
    var TopOfferBanner = [Top_offer_banner]();
    var BrandTopTry = [Brands]();
    var HomepageCategorie :Homepage_categories?
    var TrendingProducts = [Trending_products]();
    var FruitAndVegs = [FirstCategory]();
    var NewArrivals = [New_arrivals]();
    var Grocery  = [SecondCategory]();
    var FeaturedProducts = [Featured_products]();
    var mBeverageProducts = [CategoryProducts]();
    var ExploreProducts = [Explore_products]();
    
    var MainBannerCurrentPage: Int = 0
    var TopOfferCurrentPage: Int = 0
    var timer = Timer()
    var MainBannerCounter = 0
    var TopOfferBannerCounter = 0
    var BottomOfferBannerCounter = 0
    var CenterOfferBannerCounter = 0
    var a = 0
    let AppDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainBannerCollectionView.delegate = self
        mainBannerCollectionView.dataSource = self
        CenterBannerCollectionView.dataSource = self
        CenterBannerCollectionView.delegate = self
        TopOfferBannerCollectionView.delegate = self
        TopOfferBannerCollectionView.dataSource = self
        BottomBannerCollectionView.delegate = self
        BottomBannerCollectionView.dataSource = self
        BrandMustTryCollectionView.delegate = self
        BrandMustTryCollectionView.dataSource = self
        TreandingNowCollectionView.delegate = self
        TreandingNowCollectionView.dataSource = self
        RecommendedItemsCollectionView.dataSource = self
        RecommendedItemsCollectionView.delegate = self
        FruitAndVegsCollectionView.delegate = self
        FruitAndVegsCollectionView.dataSource = self
        NewArrivalsCollectionView.delegate = self
        NewArrivalsCollectionView.dataSource = self
        GroceryCollectionView.dataSource = self
        GroceryCollectionView.delegate = self
        FeaturedProductsCollectionView.delegate = self
        FeaturedProductsCollectionView.dataSource = self
        BeverageProductsCollectionView.dataSource = self
        BeverageProductsCollectionView.delegate = self
        ExploreProductsCollectionView.delegate = self
        ExploreProductsCollectionView.dataSource = self
        backViewGrocery.viewSetcornerRadius(radius: 14)
        FruitAndVegsBackView.viewSetcornerRadius(radius: 14)
        mainBanerBackView.viewRoundCorners(with: .both,radius: 14)
        TopOfferBackView.viewRoundCorners(with: .both, radius: 14)
        CenterBannerBackView.viewRoundCorners(with: .both, radius: 14)
        bottomBannerBackView.viewRoundCorners(with: .both, radius: 14)
        ShopByCategoryBackView.viewRoundCorners(with: .both,radius: 14)
        searchBackView.viewRoundCorners(with:.both,radius: 8)
        CallEndPoint()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    //MARK: - Action
    
    @IBAction func clickViewAll(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductListViewController") as? ProductListViewController
        if sender.tag == 0 {
            vc?.categoryId = "\(TrendingProducts[0].subcategory_id ?? 0)"
            vc?.subUrl = "trending-products"
            vc?.isShowSubcategory = false
            vc?.categoryName = ""
        }
        else if sender.tag == 1 {
            if !FruitAndVegs.isEmpty{
            vc?.categoryId = "\(FruitAndVegs[0].category_id ?? 0)"
            vc?.isShowSubcategory = true
                vc?.categoryName = ""}
        }
        else if sender.tag == 2 {
            vc?.categoryId = "\(TrendingProducts[0].subcategory_id ?? 0)"
            vc?.subUrl = "products-latest"
            vc?.isShowSubcategory = false
            vc?.categoryId = ""
            vc?.categoryName = ""
        }
        else if sender.tag == 3 {
            if !Grocery.isEmpty{
            vc?.categoryId = "\(Grocery[0].category_id ?? 0)"
            vc?.isShowSubcategory = true
                vc?.categoryName = ""}
        }
        else if sender.tag == 4 {
            vc?.categoryId = "\(TrendingProducts[0].subcategory_id ?? 0)"
            vc?.subUrl = "product-featured"
            vc?.isShowSubcategory = false
            vc?.categoryName = ""
        }
        else if sender.tag == 5 {
            vc?.categoryId = "\(TrendingProducts[0].subcategory_id ?? 0)"
            vc?.subUrl = "beverage-products"
            vc?.isShowSubcategory = false
            vc?.categoryName = ""
        }
        else if sender.tag == 6 {
            vc?.categoryId = "\(TrendingProducts[0].subcategory_id ?? 0)"
            vc?.subUrl = "explore-products"
            vc?.isShowSubcategory = false
            vc?.categoryName = ""
        }
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    //MARK: - Function
    
    @objc func changeImage(){
        
        
        //MARK: - Main Banner change Image
        if MainBannerCounter < MainBanner.count {
            let index = IndexPath.init(item: MainBannerCounter, section: 0)
            self.mainBannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            mainPageControl.numberOfPages = MainBanner.count
            mainPageControl.currentPage = MainBannerCounter
            MainBannerCounter += 1
        }
        else{
            MainBannerCounter = 0
            let index = IndexPath.init(item: MainBannerCounter, section: 0)
            self.mainBannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            mainPageControl.currentPage = MainBannerCounter
            
        }
        //MARK: - Top Offer Banner change Image
        if TopOfferBannerCounter < TopOfferBanner.count {
            let index = IndexPath.init(item: TopOfferBannerCounter, section: 0)
            self.TopOfferBannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            TopOfferPageControl.currentPage = TopOfferBannerCounter
            TopOfferBannerCounter += 1
        }else{
            TopOfferBannerCounter = 0
            let index = IndexPath.init(item: TopOfferBannerCounter, section: 0)
            self.TopOfferBannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            TopOfferPageControl.currentPage = TopOfferBannerCounter
        }
//        //MARK: - Center Offer Banner change Image
        if CenterOfferBannerCounter < CenterOfferBanner.count {
            let index = IndexPath.init(item: CenterOfferBannerCounter, section: 0)
            self.CenterBannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            CenterOfferBannerCounter += 1
        }
        else{
            CenterOfferBannerCounter = 0
            let index = IndexPath.init(item: CenterOfferBannerCounter, section: 0)
            self.CenterBannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            
        }
        
        //MARK: - Bottom Offer Banner change Image
        if BottomOfferBannerCounter < BottomOfferBanner.count {
            let index = IndexPath.init(item: BottomOfferBannerCounter, section: 0)
            self.BottomBannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            BottomOfferBannerCounter += 1
        }
        else{
            BottomOfferBannerCounter = 0
            let index = IndexPath.init(item:  BottomOfferBannerCounter, section: 0)
            self.BottomBannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            
        }
    }
    func CallEndPoint() {
        self.StartSpiner()
        let homePageMasterClass = HomePageMasterClass()
        homePageMasterClass.HomePageEndPoint { mdata in
            
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(HomePage_Base.self, from: mdata)
                DispatchQueue.main.async { [self] in
                    self.StopSpiner()
                    if responseModel.httpcode == 200{
                        Currency = responseModel.data?.currency ?? "SAR"
                        if let homepageCategorie = responseModel.data?.homepage_categories {
                            self.HomepageCategorie = homepageCategorie
                            self.first_categoryLabel.text = HomepageCategorie?.first_category
                            self.second_categoryLabel.text
                            = HomepageCategorie?.second_category
                        }
                    if let banner = responseModel.data?.main_banner {
                        self.MainBanner = banner
                        mainPageControl.numberOfPages = MainBanner.count
                        self.mainBannerCollectionView.reloadData()
                    }

                    if let category = responseModel.data?.category{
                        self.HomeCategory = category
                        HomeCategoryCollectionView.delegate = self
                        HomeCategoryCollectionView.dataSource = self
                        self.HomeCategoryCollectionView.reloadData()
                    }
                    if let topOffer = responseModel.data?.top_offer_banner{
                        self.TopOfferBanner = topOffer
                        TopOfferPageControl.numberOfPages = TopOfferBanner.count
                        self.TopOfferBannerCollectionView.reloadData()
                    }
                    if let centerOfferBanner = responseModel.data?.center_offer_banner{
                        self.CenterOfferBanner = centerOfferBanner
                        self.CenterBannerCollectionView.reloadData()
                    }
                    if let bottomOfferBanner = responseModel.data?.bottom_offer_banner{
                        self.BottomOfferBanner = bottomOfferBanner
                        self.BottomBannerCollectionView.reloadData()
                    }
                    if let BrandMustTry = responseModel.data?.brands{
                        self.BrandTopTry = BrandMustTry
                        self.BrandMustTryCollectionView.reloadData()
                    }
                    if let trendingProducts = responseModel.data?.trending_products{
                        self.TrendingProducts = trendingProducts
                        self.TreandingNowCollectionView.reloadData()
                    }
//                    if let trendingProducts = responseModel.data?.trending_products{
//                        self.TrendingProducts = trendingProducts
//                        self.RecommendedItemsCollectionView.reloadData()
//                    }
                    if let fruitAndVegs = responseModel.data?.first_category{
                        self.FruitAndVegs = fruitAndVegs
                        self.FruitAndVegsCollectionView.reloadData()
                    }
                    if let newArrivals = responseModel.data?.new_arrivals{
                        self.NewArrivals = newArrivals
                        self.NewArrivalsCollectionView.reloadData()
                    }
                    if let grocery = responseModel.data?.second_category {
                        self.Grocery = grocery
                        self.GroceryCollectionView.reloadData()

                    }
                    if let featuredProducts = responseModel.data?.featured_products {
                        self.FeaturedProducts = featuredProducts
                        self.FeaturedProductsCollectionView.reloadData()
                    }
                    if let beverageProducts = responseModel.data?.category_products {
                        self.mBeverageProducts = beverageProducts
                        self.BeverageProductsCollectionView.reloadData()
                    }

                    if let exploreProducts = responseModel.data?.explore_products {
                        self.ExploreProducts = exploreProducts
                        self.ExploreProductsCollectionView.reloadData()
                    }
                   timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
                    }
                    else {
                        DispatchQueue.main.async {
                            if let cont = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController, !(cont.viewControllers.last is LoginPageViewController) {
                                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                                let myobject = storyBoard.instantiateViewController(withIdentifier: "LoginPageViewController")
                                cont.pushViewController(myobject, animated: true)
                                let domain = Bundle.main.bundleIdentifier!
                                UserDefaults.standard.removePersistentDomain(forName: domain)
                                UserDefaults.standard.synchronize()
                            }
                        }
                        //AppDelegate.goToLogin()
                    }
                    
                }
            }catch(let Error){
                self.StopSpiner()
                print(Error.localizedDescription)
            }
        }
    }
}

@available(iOS 13.0, *)
extension HomePageVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == HomeCategoryCollectionView {
            return 12
            
        }
        else if collectionView == TopOfferBannerCollectionView {
            return TopOfferBanner.count
        }
        else if collectionView == CenterBannerCollectionView {
            return CenterOfferBanner.count
        }
        else if collectionView == BottomBannerCollectionView {
            return BottomOfferBanner.count
        }
        
        else if collectionView == BrandMustTryCollectionView {
            return BrandTopTry.count
        }
        else if collectionView == TreandingNowCollectionView {
            return TrendingProducts.count
        }
        else if collectionView == RecommendedItemsCollectionView {
            return TrendingProducts.count
        }
        else if collectionView == FruitAndVegsCollectionView {
            return FruitAndVegs.count
        }
        else if collectionView == NewArrivalsCollectionView {
            return NewArrivals.count
        }
        else if collectionView == GroceryCollectionView {
            return Grocery.count
        }
        else if collectionView == FeaturedProductsCollectionView {
            return FeaturedProducts.count
        }
        else if collectionView == ExploreProductsCollectionView {
            return ExploreProducts.count
        }
        else if collectionView == BeverageProductsCollectionView {
            return mBeverageProducts.count
        }
        
        else{
            return MainBanner.count
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == ExploreProductsCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionViewCell", for: indexPath) as! ExploreCollectionViewCell
            if !(ExploreProducts[indexPath.row].image?.isEmpty ?? false) {
                if let url = URL(string: ExploreProducts[indexPath.row].image?[0].image ?? ""){
                    print("#URL\(url)")
                    cell.ProductImage.sd_setImage(with: url, placeholderImage: UIImage(named: "logo") )
                }}
            cell.BackView.viewSetcornerRadius(radius: 8)
            cell.ProductNameLabel.text = ExploreProducts[indexPath.row].product_name
            return cell
        }
        
        if collectionView == BeverageProductsCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeverageProductsCollectionViewCell", for: indexPath) as! BeverageProductsCollectionViewCell
            if !(mBeverageProducts[indexPath.row].image?.isEmpty ?? false) {
                if let url = URL(string: mBeverageProducts[indexPath.row].image?[0].image ?? ""){
                    print("#URL\(url)")
                    cell.PriceLabel.text = "\(mBeverageProducts[indexPath.row].actual_price ?? "0") \(Currency)"
                    cell.ProductImage.sd_setImage(with: url, placeholderImage: UIImage(named: "logo") )
                   
               }}
            cell.BackView.viewRoundCorners(with: .both, radius: 5,showBorders: true)
                    cell.ProductNameLabel.text = mBeverageProducts[indexPath.row].product_name
            return cell
        }
        
        if collectionView == FeaturedProductsCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedProductsCollectionViewCell", for: indexPath) as! FeaturedProductsCollectionViewCell
            if !(FeaturedProducts[indexPath.row].image?.isEmpty ?? false) {
                if let url = URL(string: FeaturedProducts[indexPath.row].image?[0].image ?? ""){
                    print("#URL\(url)")
                    // cell.ProductImage.sd_setImage(with:url, completed: nil)
                    cell.ProductImage.sd_setImage(with: url, placeholderImage: UIImage(named: "logo") )
                }}
            
            cell.ProductNameLabel.text = FeaturedProducts[indexPath.row].product_name
            cell.PriceLabel.text = "\(FeaturedProducts[indexPath.row].actual_price ?? "0") \(Currency)"
            cell.BackView.viewSetcornerRadius(radius: 8)
            cell.BackView.AddShadow()
            return cell
        }
        if collectionView == GroceryCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroceryCollectionViewCell", for: indexPath) as! GroceryCollectionViewCell
            
            if let url = URL(string: Grocery[indexPath.row].subcategory_image ?? ""){
                print("#URL\(url)")
                // cell.ProductImage.sd_setImage(with:url, completed: nil)
                cell.ProductImage.sd_setImage(with: url, placeholderImage: UIImage(named: "logo") )
            }
            
            cell.ProductName.text = Grocery[indexPath.row].subcategory_name
            return cell
        }
        
        if collectionView == NewArrivalsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewArrivalsCollectionViewCell", for: indexPath) as! NewArrivalsCollectionViewCell
            if !(NewArrivals[indexPath.row].image?.isEmpty)! {
                if let url = URL(string: NewArrivals[indexPath.row].image?[0].image ?? ""){
                    print("#URL\(url)")
                    cell.ProductImage.sd_setImage(with:url, completed: nil)
                }}
            cell.backView.viewSetcornerRadius(radius: 8)
            cell.backViewDisPrice.viewSetcornerRadius(radius: 4,showShadow: false)
            cell.shortDescriptionLabel.text = NewArrivals[indexPath.row].product_name ?? ""
            let price = NewArrivals[indexPath.row].actual_price  == "NULL" ? "0.00" :NewArrivals[indexPath.row].actual_price ?? ""
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "\(price)\(Currency)")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
            cell.priceLabel.attributedText = attributeString
            cell.offLabel.text = "60%\nOFF"
           // cell.qtyLabel.text = "1 Kg"
            return cell
        }
        
        if collectionView == FruitAndVegsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FruitAndVegsCollectionViewCell", for: indexPath) as! FruitAndVegsCollectionViewCell
            
            if let url = URL(string: FruitAndVegs[indexPath.row].subcategory_image ?? ""){
                cell.ProductImage.sd_setImage(with:url, completed: nil)
            }
            cell.ProductNameLabel.text = FruitAndVegs[indexPath.row].subcategory_name
            
            return cell
        }
        if collectionView == RecommendedItemsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedItemsCollectionViewCell", for: indexPath) as! RecommendedItemsCollectionViewCell
            
           // if let url = URL(string: TrendingProducts[indexPath.row].image?[0].image ?? ""){
           //    cell.ProductImage.sd_setImage(with:url, completed: nil)
           // }
            
           // cell.descriptionLabel.text = TrendingProducts[indexPath.row].product_name
           // cell.priceLabel.text = "\(TrendingProducts[indexPath.row].actual_price ?? "-") SAR"
           // cell.qtyLabel.text = ""
            return cell
        }
        
        if collectionView == TreandingNowCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TreandingNowCollectionViewCell", for: indexPath) as! TreandingNowCollectionViewCell
            if !(TrendingProducts[indexPath.row].image?.isEmpty ?? true) {
            if let url = URL(string: TrendingProducts[indexPath.row].image?[0].image ?? ""){
                cell.TreandingProductImage.sd_setImage(with:url, completed: nil)
            }}
            cell.offLabel.text = "69%\nOFF"
            
            cell.ProductName.text = TrendingProducts[indexPath.row].product_name
          //  cell.priceLabel.text = "\(TrendingProducts[indexPath.row].actual_price ?? "-") SAR"
            cell.qtyLabel.text = "1 Kg"
            cell.priceLabel.text = "\(TrendingProducts[indexPath.row].actual_price ?? "" )\(Currency)"
            cell.BackView.viewSetcornerRadius(radius: 8)
            return cell
        }
        
        if collectionView == HomeCategoryCollectionView {
            if indexPath.row < 11 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCollectionViewCell", for: indexPath) as! HomeCategoryCollectionViewCell
                cell.BackView.viewSetcornerRadius(radius: 6)
                cell.productName.text = HomeCategory[indexPath.row].category_name ?? ""
                if let url = URL(string: HomeCategory[indexPath.row].image ?? ""){
                    cell.productimages.sd_setImage(with:url, completed: nil)
                }
                return cell
            } else if indexPath.row == 11{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCollectionViewCell", for: indexPath) as! HomeCategoryCollectionViewCell
                cell.BackView.viewSetcornerRadius(radius: 6)
                cell.productimages.contentMode =  UIView.ContentMode.center
                cell.productName.text = "View all"
                cell.productimages.image = UIImage(named: "all")!
                
                return cell
            }
            
            else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCollectionViewCell", for: indexPath) as! HomeCategoryCollectionViewCell
                return cell
            }
            
            
        }
        else if collectionView == TopOfferBannerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopOfferBannerCollectionViewCell", for: indexPath) as! TopOfferBannerCollectionViewCell
            
            if let url = URL(string: TopOfferBanner[indexPath.row].media ?? ""){
                cell.topOfferBannerImage.sd_setImage(with:url, completed: nil)
                
            }
            return cell
        }
        else if collectionView == BrandMustTryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandMustTryCollectionViewCell", for: indexPath) as! BrandMustTryCollectionViewCell
            
            cell.backView.viewSetcornerRadius(radius: 8)
            cell.backView.AddShadow()
            
            if let url = URL(string: BrandTopTry[indexPath.row].brand_image ?? ""){
                cell.brandImage.sd_setImage(with:url, completed: nil)
                
            }
            return cell
        }
        else if collectionView == CenterBannerCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CenterOfferBannerCollectionViewCell", for: indexPath) as! CenterOfferBannerCollectionViewCell
            
            if let url = URL(string: CenterOfferBanner[indexPath.row].media ?? ""){
                cell.BannerImage.sd_setImage(with:url, completed: nil)
            }
            return cell
        }
        
        else if collectionView == BottomBannerCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomOfferBannerCollectionViewCell", for: indexPath) as! BottomOfferBannerCollectionViewCell
            
            if let url = URL(string: BottomOfferBanner[indexPath.row].media ?? ""){
                cell.BannerImage.sd_setImage(with:url, completed: nil)
            }
            return cell
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageMainBannerCollectionViewCell", for: indexPath) as! HomePageMainBannerCollectionViewCell
            cell.backViewImage.viewSetcornerRadius(radius: 14,showShadow: false)
            if let url = URL(string: MainBanner[indexPath.row].media ?? ""){
                cell.bannerImage.sd_setImage(with:url, completed: nil)
            }
            else {
                print("#invalied \(MainBanner[indexPath.row].media)")
            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == HomeCategoryCollectionView {
            
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth/5, height:  self.view.frame.width / 4.5)
        }
        
        else if collectionView == TopOfferBannerCollectionView {
            return CGSize(width: self.view.frame.width , height: 230)
        }
        else if collectionView == BrandMustTryCollectionView {
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth/4, height:  self.view.frame.width / 5)
        }
        else if collectionView == TreandingNowCollectionView || collectionView == RecommendedItemsCollectionView{
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth/2.8, height:  self.view.frame.width / 2)
        }
       
        else if collectionView == FruitAndVegsCollectionView ||  collectionView == GroceryCollectionView{
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth/2.3, height:  self.view.frame.width / 2.5)
        }
        else if collectionView == NewArrivalsCollectionView {
            
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth/2.3, height:  self.view.frame.width / 2.1)
        }
        else if collectionView == FeaturedProductsCollectionView {
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth/2.3, height:  self.view.frame.width / 2.1)
        }
        else if collectionView == BeverageProductsCollectionView {
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth/2.5, height:  self.view.frame.width / 2.3)
        }
        else if collectionView == ExploreProductsCollectionView {
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth/3, height:  self.view.frame.width / 2.5)
        }
        else if collectionView == BottomBannerCollectionView || collectionView == CenterBannerCollectionView {
            return CGSize(width: self.view.frame.width , height: 275)
        }
        else{
           
            return CGSize(width: self.view.frame.width , height: 275
            )
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == BrandMustTryCollectionView || collectionView == TreandingNowCollectionView || collectionView == NewArrivalsCollectionView || collectionView == FeaturedProductsCollectionView{
           
            return 16
       }
        return 2
    }
    
    // Cell Margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
         if collectionView == NewArrivalsCollectionView {

             return UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 8)
        }
        if collectionView == BrandMustTryCollectionView {
           
            return UIEdgeInsets(top:4, left: 4, bottom: 4, right: 4)
       }
        
        
        else{
            return UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        }
       
    }
    
    //MARK: - Did Select
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("#Did Select")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductListViewController") as? ProductListViewController
        if collectionView == HomeCategoryCollectionView {
            if indexPath.row < 11 {
            vc?.categoryId = "\(HomeCategory[indexPath.row].id ?? 0)"
            vc?.categoryName = HomeCategory[indexPath.row].category_name ?? ""
            vc?.isShowSubcategory = true
            self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
        
        if collectionView == BrandMustTryCollectionView {
            vc?.brandId = "\(BrandTopTry[indexPath.row].brand_id ?? 0)"
            vc?.isCallFilterApi = true
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        if collectionView == TreandingNowCollectionView {
           
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
            vc?.categoryId = TrendingProducts[indexPath.row].product_id ?? 0
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        
        if collectionView == NewArrivalsCollectionView {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
            vc?.categoryId = NewArrivals[indexPath.row].product_id ?? 0
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        if collectionView == FruitAndVegsCollectionView {
            vc?.subcategoryId = "\(FruitAndVegs[indexPath.row].id ?? 0)"
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        if collectionView == GroceryCollectionView {
            vc?.subcategoryId = "\(Grocery[indexPath.row].id ?? 0)"
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        
        if collectionView == FeaturedProductsCollectionView {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
            vc?.categoryId = FeaturedProducts[indexPath.row].product_id ?? 0
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        if collectionView == BeverageProductsCollectionView {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
            vc?.categoryId = mBeverageProducts[indexPath.row].product_id ?? 0
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        if collectionView == ExploreProductsCollectionView {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
            vc?.categoryId = ExploreProducts[indexPath.row].product_id ?? 0
            self.navigationController?.pushViewController(vc!, animated: true)
        }
       
    }
    
    
}
extension UIPageControl {

    func customPageControl(dotFillColor:UIColor, dotBorderColor:UIColor, dotBorderWidth:CGFloat) {
        for (pageIndex, dotView) in self.subviews.enumerated() {
            if self.currentPage == pageIndex {
                dotView.backgroundColor = dotFillColor
                dotView.layer.cornerRadius = dotView.frame.size.height / 2
            }else{
                dotView.backgroundColor = .clear
                dotView.layer.cornerRadius = dotView.frame.size.height / 2
                dotView.layer.borderColor = dotBorderColor.cgColor
                dotView.layer.borderWidth = dotBorderWidth
            }
        }
    }

}
