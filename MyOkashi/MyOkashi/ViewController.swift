//
//  ViewController.swift
//  MyOkashi
//
//  Created by がり on 2020/08/04.
//  Copyright © 2020 がり. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Search Barのdelegate通知先の設定
        searchText.delegate = self
        // 入力のヒントとなる、プレースホルダーを設定
        searchText.placeholder = "お菓子の名前を入力してください"
    }


    @IBOutlet weak var searchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // 検索ボタンをクリック（タップ）時
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // キーボードを閉じる
        view.endEditing(true)
        
        if let searchWord = searchBar.text {
            // デバッグエリアに出力
            print(searchWord)
            // 入力された、お菓子を検索
            searchOkashi(keyword: searchWord)
        }
    }
    
    // searchOkashiメソッド
    // 第一引数:keyword 検索したいワード
    func searchOkashi(keyword : String) {
        // お菓子の検索キーワードをURLエンコードする
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        // リクエストURLの組み立て
        guard let req_url = URL(string:"https://www.sysbird.jp/toriko/api/?apikey=quest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        print(req_url)
    }
}

