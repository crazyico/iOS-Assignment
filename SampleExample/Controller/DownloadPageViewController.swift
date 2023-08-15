//
//  DownloadPageViewController.swift
//  SampleExample
//
//  Created by JAY on 10/08/23.
//

import UIKit

class DownloadPageViewController: UIViewController {
    
    var img = ["logo3", "logo4", "logo5", "logo6", "logo2", "logo1",]
    var circularProgressBarView: CircularProgressBarView!
    var circularViewDuration: TimeInterval = 2
    var currentPage = 0 {
        didSet {
            if currentPage == img.count - 1  {
                btncollectionPlay.isEnabled = true
            } else {
                btncollectionPlay.isEnabled = false
            }
        }
    }
    
    @IBOutlet weak var imgGame: UIImageView!
    @IBOutlet weak var lblGameName: UILabel!
    @IBOutlet weak var lblGameDescription: UILabel!
    @IBOutlet weak var btnDownload: UIButton!
    @IBOutlet weak var collectionImageView: UICollectionView!
    @IBOutlet weak var lblPercentage: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var viewPopUp: UIView!
    @IBOutlet weak var collectionPlayView: UICollectionView!
    @IBOutlet weak var btncollectionPlay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCell()
        collectionImageView.delegate = self
        collectionImageView.dataSource = self
        collectionPlayView.delegate = self
        collectionPlayView.dataSource = self
        setUpUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        
        if touch?.view != viewPopUp {
            viewPopUp.isHidden = true
        }
    }
    
    func setUpCircularProgressBarView() {
            lblPercentage.isHidden = false
           // set view
           circularProgressBarView = CircularProgressBarView(frame: .zero)
           // align to the center of the screen
           circularProgressBarView.center = view.center
           // call the animation with circularViewDuration
           circularProgressBarView.progressAnimation(duration: circularViewDuration)
           // add this view to the view controller
           view.addSubview(circularProgressBarView)
       }
    
    func setUpUI() {
        imgGame.layer.cornerRadius = 15
        btnDownload.layer.cornerRadius = 25
        btnDownload.titleLabel?.text = "DOWNLOAD"
        lblGameName.text = "BOMBER MAN"
        lblGameDescription.text = "SUPER BOMBERMAN R ONLINE is out on Stadia today! Tweets by Bomberman_en. Bomberman Official Steam Page. Official Bomberman Facebook Page."
        lblPercentage.isHidden = true
        btnPlay.isHidden = true
        btnDownload.isHidden = false
        btnPlay.layer.cornerRadius = 25
        viewPopUp.layer.cornerRadius = 25
        viewPopUp.isHidden = true
        btncollectionPlay.layer.cornerRadius = 20
    }
    
    func registerCell() {
        collectionImageView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionPlayView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
    }
    
    @IBAction func btnDownloadPressed(_ sender: Any) {
        setUpCircularProgressBarView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.circularProgressBarView.isHidden = true
            self.lblPercentage.isHidden = true
            self.btnDownload.isHidden = true
            self.btnPlay.isHidden = false
        }
    }
    
    @IBAction func btnPlayPressed(_ sender: Any) {
        viewPopUp.isHidden = false
    }
    
    @IBAction func btnCollectionPlayPressed(_ sender: Any) {
    }
    
    
}

extension DownloadPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath as IndexPath) as! ImageCollectionViewCell
        cell.imgCell.image = UIImage(named: "\(img[indexPath.row])")
        return cell
    }
}
