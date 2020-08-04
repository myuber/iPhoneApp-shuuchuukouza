//
//  EffectViewController.swift
//  MyCamera
//
//  Created by がり on 2020/08/03.
//  Copyright © 2020 がり. All rights reserved.
//

import UIKit

class EffectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // エフェクト前画像
    // 前の画面より画像を設定
    var originalImage : UIImage?
    
    
    @IBOutlet weak var effectImage: UIImageView!
    @IBAction func effectButtonAction(_ sender: Any) {
        // エフェクト前画像をアンラップしてエフェクト用画像として取り出す
        if let image = originalImage {
            // フィルター名を指定
            let filterName = "CIPhotoEffectMono"
            // 元々の画像の回転角度を取得
            let rotate = image.imageOrientation
            // UIImage形式の画像をCIImage形式に変換
            let inputImage = CIImage(image: image)
            // フィルターの種別を引数で指定された種類を指定してCIFilterのインスタンスを取得
            guard let effectFilter = CIFilter(name: filterName) else {
                return
            }
            // エフェクトのパラメータを初期化
            effectFilter.setDefaults()
            // インスタンスにエフェクトする元画像を設定
            effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
            // エフェクト後のCIImage形式の画像を取り出す
            guard let outputImage = effectFilter.outputImage else {
                return
            }
            // CIContextのインスタンスを取得
            let ciContext = CIContext(options: nil)
            // エフェクト後の画像をCIContext上に描画し、結果をcgImageとしてCGImage形式の画像を取得
            guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else {
                return
            }
            // エフェクト後の画像をCGImage形式からUIImage形式に変換。その際に回転角度を指定。そしてImageViewに表示
            effectImage.image = UIImage(cgImage: cgImage, scale: 1.0, orientation: rotate)
        }
    }
    @IBAction func shareButtonAction(_ sender: Any) {
    }
    @IBAction func closeButtonAction(_ sender: Any) {
    }
    
    
}
