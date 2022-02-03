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
    private lazy var hotelNameLbl = UILabel()
    private lazy var hotelAddressLbl = UILabel()
    private lazy var centerDistanceLbl = UILabel()
    private lazy var starsLbl = UILabel()
    private lazy var hotelImage = UIImageView()
    private lazy var addressImage = UIImageView()
    
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
        setupConstraints()
        settingView()
    }

    //MARK: - Public methods
    public func configure(with model: HotelFullInfoData?) {
        hotelNameLbl.text = model?.name ?? "unknown name"
        hotelAddressLbl.text = model?.fullInfo.address ?? "unknown address"
        centerDistanceLbl.text = String(describing: Int(model?.fullInfo.distance ?? 0)) + "м от центра"
        starsLbl.text = String(repeating: "★", count: model?.fullInfo.stars ?? 0) + String(repeating: "☆", count: 5 - (model?.fullInfo.stars ?? 0))
        fetchImage(with: model?.id ?? 0, imgID: model?.fullInfo.firstImage ?? "")
    }
}

//MARK: - Extention for setting hotel list cells
extension HLTableViewCell {
    
    private func fetchImage(with HotelID: Int, imgID: String) {
        networkDataFetcher?.fetchImage(withHotelID: HotelID, imgID: imgID, image: hotelImage)
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
        hotelImage.clipsToBounds = true
        hotelImage.layer.cornerRadius = 8

//        hotelImage.layer.shadowColor = UIColor.gray.cgColor
//        hotelImage.layer.shadowOffset = .zero
//        hotelImage.layer.shadowOpacity = 0.8
//        hotelImage.layer.shadowRadius = 2
        
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
        
        hotelImage.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(80)
            make.leading.equalToSuperview().inset(15)
            make.top.bottom.equalToSuperview().inset(10)
        }
        
        hotelNameLbl.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(115)
            make.trailing.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(8)
        }
        
        hotelAddressLbl.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(132)
            make.trailing.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(47)
        }
        
        addressImage.snp.makeConstraints { make in
            make.width.height.equalTo(16)
            make.leading.equalToSuperview().inset(115)
            make.top.equalToSuperview().inset(48)
            
        }
        
        centerDistanceLbl.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(116)
            make.top.equalToSuperview().inset(72)
            make.trailing.equalTo(starsLbl).inset(15)
        }
        
        starsLbl.textAlignment = .right
        starsLbl.snp.makeConstraints { make in
            make.width.height.equalTo(12)
            make.trailing.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(270)
            make.top.equalToSuperview().inset(73)
        }
    }
}
