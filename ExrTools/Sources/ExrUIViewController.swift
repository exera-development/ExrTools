//
//  ExrUIViewController.swift
//  Goin
//
//  Created by Attila Janosi on 02/11/2018.
//  Copyright © 2018 Goin. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Material

protocol ExrViewControllerProtocol {
    func initView()
}

typealias EXRViewController = ExrUIViewController & ExrViewControllerProtocol

public class ExrUIViewController: UIViewController {
    
    private let container: UIView = UIView()
    private let loadingView: UIView = UIView()
    private let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    public let disposeBag = DisposeBag()
    
    private let mMainView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.colorPrimary
        return view
    }()
    
    public var mainView: UIView{
        get{
            return self.mMainView
        }
        set{
            self.mMainView.addSubview(newValue)
        }   
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.colorPrimary
        
        view.addSubview(mMainView)
        mMainView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(0)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(0)
                make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(0)
                make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(0)
            } else {
                make.top.equalTo(self.view.snp.top).offset(20)
                make.bottom.equalTo(self.view.snp.bottom).offset(20)
                make.right.equalTo(self.view.snp.right).offset(0)
                make.left.equalTo(self.view.snp.left).offset(0)
            }
        }
        
        guard let controller = self as? EXRViewController else {
            return
        }
        
        controller.initView()
    }
    
    public func showProgress(){
        OperationQueue.main.addOperation {
            let uiView = self.view!
            self.container.frame = uiView.frame
            self.container.center = uiView.center
            self.container.backgroundColor = UIColor(rgbValue: 0xffffff, alpha: 0.3)
            
            self.loadingView.frame =  CGRect(x:0.0, y:0.0, width:80.0, height: 80.0);
            self.loadingView.center = uiView.center
            self.loadingView.backgroundColor = UIColor(rgbValue: 0x444444, alpha: 0.7)
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10
            
            self.activityIndicator.frame =  CGRect(x:0.0, y:0.0, width:40.0, height: 40.0);
            self.activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
            self.activityIndicator.center = CGPoint(x: self.loadingView.frame.size.width / 2,y: self.loadingView.frame.size.height / 2);
            
            self.loadingView.addSubview(self.activityIndicator)
            self.container.addSubview(self.loadingView)
            self.container.tag=990
            uiView.addSubview(self.container)
            self.activityIndicator.startAnimating()
        }
    }
    
    public func hideProgress(){
        OperationQueue.main.addOperation {
            self.container.removeFromSuperview()
            self.activityIndicator.stopAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }


}
