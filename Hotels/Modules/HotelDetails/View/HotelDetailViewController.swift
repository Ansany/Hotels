//
//  HotelDetailViewController.swift
//  Hotels
//
//  Created by Andrey Alymov on 25.01.2022.
//

import UIKit
import MapKit

class HotelDetailViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var hotelNameLbl: UILabel!
    @IBOutlet weak var starsLbl: UILabel!
    @IBOutlet weak var roomsLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - IBActions
    @IBAction func bookClicked(_ sender: UIButton) {
    }
    
}
