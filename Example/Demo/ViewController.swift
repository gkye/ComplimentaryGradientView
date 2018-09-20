//
//  ViewController.swift
//  Demo
//
//  Created by George Kye on 2016-08-22.
//  Copyright © 2016 George Kye. All rights reserved.
//

import UIKit
import ComplimentaryGradientView

//REMIND ME: Clean up Demo

enum CollectionContent {
    enum Option {
        case position, gradientType
    }
    case images([UIImage], selectedIndex: Int)
    case options(titles: [String], selectedIndex: Int, option: Option)
    case header(String)
}

protocol InnerCollectionDelegate: class {
    func innerCollection(didSelected index: IndexPath, content: CollectionContent)
}

struct GradientUIConfig {
    var selectedImageIndex: Int = 0
    var selectedGradientVarientIndex: Int = 1
    var gradientTypes: [String] = []
    var selectedPositonIndex: Int = 0
    var positonOptions: [GradientStartPoint] = [GradientStartPoint.top,.right, .left, .topLeft, .bottom,
                                                .topRight,  .bottomLeft, .bottomRight]
    
    init() {
        let all: [GradientVariant] = [.primary, .secondary, .background, .detail]
        let gradientCombinations =  Combinatorics.permutationsWithoutRepetitionFrom(all.map{$0.rawValue}, taking: 2).compactMap{
            $0.joined(separator: ".")
        }
        gradientTypes = ["All"] + gradientCombinations
    }
}

class ViewController: UIViewController, ComplimentaryGradientViewDelegate {
    
    private let collectionImgs = [#imageLiteral(resourceName: "broncos_panthers_br"), #imageLiteral(resourceName: "panclajn-16-v01-2_1x"), #imageLiteral(resourceName: "dmb_25th_gorge"), #imageLiteral(resourceName: "sunshine-illo"), #imageLiteral(resourceName: "steven-roe-1058281-unsplash")]

    var dataSource: [CollectionContent] = []
    @IBOutlet var compGraidentView: ComplimentaryGradientView!
    @IBOutlet weak var tableView: UITableView!
    
    var config = GradientUIConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        compGraidentView.backgroundExecution = true
        compGraidentView.delegate = self
        configureDataSource()
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configureDataSource(){
        dataSource = [
            .header("Image Source"),
            .images(collectionImgs, selectedIndex: config.selectedImageIndex),
            .header("Type"),
            .options(titles: config.gradientTypes, selectedIndex: config.selectedGradientVarientIndex, option: .gradientType),
            .header("Position"),
            .options(titles: config.positonOptions.map{$0.rawValue}, selectedIndex: config.selectedPositonIndex, option: .position)
        ]
        
        compGraidentView.gradientStartPoint = config.positonOptions[config.selectedPositonIndex]
        compGraidentView.image = collectionImgs[config.selectedImageIndex]
        compGraidentView.gradient_type = config.gradientTypes[config.selectedGradientVarientIndex]
        tableView.reloadData()
    }
    
    func complimentaryGradientView(didSetGradient gradientView: ComplimentaryGradientView, gradientSet: Bool) {
        //    print("Gradient set 🌞")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, InnerCollectionDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataSource[indexPath.row] {
        case .header(let header):
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            cell.textLabel?.textColor = .white
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.text = header
            cell.backgroundColor = .clear
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "collection", for: indexPath) as! DemoCollectionCell
            cell.dataSource = dataSource[indexPath.row]
            cell.selectionDelegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch dataSource[indexPath.row] {
        case .header:
            return 40
        case .images:
            return 120
        case .options:
            return 55
        }
    }
    
    func innerCollection(didSelected index: IndexPath, content: CollectionContent) {
        switch content {
        case .header: break
        case .images:
            config.selectedImageIndex = index.row
        case .options(titles: _, selectedIndex: _, option: let option):
            switch option {
            case .gradientType:
                config.selectedGradientVarientIndex = index.row
            case .position:
                config.selectedPositonIndex = index.row
            }
        }
        configureDataSource()
    }
}

class DemoCollectionCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    weak var selectionDelegate: InnerCollectionDelegate?
    var dataSource: CollectionContent! {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension DemoCollectionCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let _ = dataSource else { return 0 }
        switch dataSource! {
        case .header:
            return 1
        case .images(let imgs, _):
            return imgs.count
        case .options(titles: let t, _, _):
            return t.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch dataSource! {
        case .images(let imgs, let selectedIndex):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell
            cell.imageView.image = imgs[indexPath.row]
            cell.layer.borderWidth = (selectedIndex == indexPath.row) ? 4 : 0
            cell.layer.borderColor = UIColor.white.cgColor
            return cell
        case .options(titles: let titles, selectedIndex: let selectedIndex, option: _):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "optionCell", for: indexPath) as! OptionCell
            cell.label.textColor = (selectedIndex == indexPath.row) ?  .cyan : .white
            cell.label.text = titles[indexPath.row]
            return cell
        default: fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.bounds.width - 10
        let h = collectionView.bounds.height - 8
        switch dataSource! {
        case .images:
            let sz =  (w / 3)
            return CGSize.init(width: sz, height: h)
        case .options(titles: let t, _, _):
            let attributes = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 21)
            ]
            let attributedString = NSAttributedString(string: t[indexPath.row], attributes :attributes )
            let boundingRect = attributedString.boundingRect(
                with: CGSize(width: w, height: h), options: [.usesLineFragmentOrigin, .usesDeviceMetrics], context: nil)
            
            return CGSize.init(width: boundingRect.width + 32, height: h)
        default: fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionDelegate?.innerCollection(didSelected: indexPath, content: dataSource)
    }
}

class ImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.bounds.height * 0.2
        clipsToBounds = true
    }
}

class OptionCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.bounds.height * 0.2
        clipsToBounds = true
    }
}
