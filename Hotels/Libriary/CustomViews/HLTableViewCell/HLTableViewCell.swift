//
//  HLTableViewCell.swift
//  Hotels
//
//  Created by Andrey Alymov on 21.01.2022.
//

import UIKit
import SnapKit

class HLTableViewCell: UITableViewCell {
    
    //MARK: - Cell identifier
    static let identifier = String(describing: HLTableViewCell.self)
    
    //MARK: - Private properties
    private var hotelNameLbl = UILabel()
    private var hotelAddressLbl = UILabel()
    private var centerDistanceLbl = UILabel()
    private var starsLbl = UILabel()
    private var hotelImage = UIImageView()
    private var addressImage = UIImageView()
    
    //MARK: - Public properties
    var networkDataFetcher: ApiNetworkDataFetcherProtocol? = ApiNetworkDataFetcher()
    
    //MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func setupCells() {
        addSubviews()
        settingView()
        setupConstraints()
    }

    //MARK: - Public methods
    public func configure(with model: HotelFullInfoData?) {
        hotelNameLbl.text = model?.name ?? "unknown name"
        hotelAddressLbl.text = model?.address ?? "unknown adress"
        centerDistanceLbl.text = String(describing: Int(model?.distance ?? 0)) + "m from center"
        starsLbl.text = String(repeating: "★", count: Int(model?.stars ?? 0)) + String(repeating: "☆", count: 5 - Int(model?.stars ?? 0))
        fetchImage(with: model?.id ?? 40611)
    }
}

//MARK: - Extention for setting hotel list cells
extension HLTableViewCell {
    
    private func fetchImage(with id: Int) {
        networkDataFetcher?.fetchHotel(withHotelID: id) { [ weak self ] result in
            switch result {
            case .success(let data):
                    self?.networkDataFetcher?.fetchImage(withID: data?.image ?? "", image: self?.hotelImage ?? UIImageView())
            case .failure(let error):
                self?.hotelImage.image = UIImage(systemName: "NoPhoto")
                print("Image fetching error - \(error.localizedDescription)")
            }
        }
    }
    
    //MARK: - Adding all subviews
    private func addSubviews() {
        addSubview(hotelNameLbl)
        addSubview(hotelAddressLbl)
        addSubview(centerDistanceLbl)
        addSubview(hotelImage)
        addSubview(addressImage)
        addSubview(starsLbl)
    }
    
    //MARK: - Make others settings
    private func settingView() {
        
        // hotel main image
        hotelImage.contentMode = .scaleAspectFill
        hotelImage.layer.masksToBounds = true
        hotelImage.frame = bounds
        hotelImage.layer.cornerRadius = 8
        hotelImage.layer.borderWidth = 2
        hotelImage.layer.borderColor = .init(gray: 1, alpha: 1)
        hotelImage.layer.shadowColor = UIColor.gray.cgColor
        hotelImage.layer.shadowOffset = .zero
        hotelImage.layer.shadowOpacity = 0.2
        hotelImage.layer.shadowRadius = 2
        
        // fonts size
        hotelNameLbl.font = .boldSystemFont(ofSize: 20)
        centerDistanceLbl.font = .italicSystemFont(ofSize: 14)
        hotelAddressLbl.font = .systemFont(ofSize: 16)
        
        // text colors
        starsLbl.textColor = .orange
        centerDistanceLbl.textColor = .systemGray
        
        // location pin (adress image)
        addressImage.image = UIImage(named: "PinLocation")
    }
    
    //MARK: - Make constraints for cell elements
    private func setupConstraints() {
        
        // main hotel image
        hotelImage.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(80)
            make.left.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
        // hotel name label
        hotelNameLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(115)
            make.right.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(8)
        }
        
        // hotel address label
        hotelAddressLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(132)
            make.right.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(47)
        }
        
        // location pin (adress image)
        addressImage.snp.makeConstraints { make in
            make.width.equalTo(16)
            make.height.equalTo(16)
            make.left.equalToSuperview().inset(115)
            make.top.equalToSuperview().inset(48)
            
        }
        
        // distance from city center
        centerDistanceLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(116)
            make.top.equalToSuperview().inset(72)
            make.right.equalTo(starsLbl).inset(15)
        }
        
        // hotel stars
        starsLbl.textAlignment = .right
        starsLbl.snp.makeConstraints { make in
            make.width.equalTo(12)
            make.height.equalTo(12)
            make.right.equalToSuperview().inset(15)
            make.left.equalToSuperview().inset(270)
            make.top.equalToSuperview().inset(73)
        }
    }
}
