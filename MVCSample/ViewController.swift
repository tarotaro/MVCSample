//
//  ViewController.swift
//  MVCSample
//
//  Created by 中村太郎 on 2023/11/13.
//

import UIKit

protocol View: AnyObject {
    func showLoading()
    func hideLoading()
    func setData(data1: String, data2: String)
}

class ViewController: UIViewController, View {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    private lazy var presenter: ViewPresenter = MVCViewPresenter(view: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.presenter.allRunApi()
    }

    func showLoading() {
        self.view.showLoading()
    }
    
    func hideLoading() {
        self.view.hideLoading()
    }
    
    func setData(data1: String, data2: String) {
        label1.text = data1
        label2.text = data2
    }
}

