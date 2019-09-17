//
//  ExrUIViewController.swift
//  Goin
//
//  Created by Attila Janosi on 02/11/2018.
//  Copyright © 2018 Goin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Material
import SnapKit

public protocol ExrViewControllerProtocol {
    func initView() 
}

public typealias EXRViewController = ExrUIViewController & ExrViewControllerProtocol

open class ExrUIViewController: UIViewController {
    
    private let container: UIView = UIView()
    private let loadingView: UIView = UIView()
    private let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    public let disposeBag = DisposeBag()
    
    private let mMainView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.white
        return view
    }()
    
    private let bottomView: UIView = {
       let view = UIView()
        view.backgroundColor = Colors.white
        return view
    }()
    
    //header
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.colorPrimaryDark
        return view
    }()
    
    private let backButton: IconButton = {
        let button = IconButton()
        button.image = Icon.arrowBack
        button.tintColor = Colors.white
        return button
    }()
    
    public let headerContainer: UIView = {
        let view = UIView()
        return view
    }()
    //header end
    
    public var mainView: UIView{
        get{
            return self.mMainView
        }
        set{
            self.mMainView.addSubview(newValue)
        }   
    }
    
    public var topColor: UIColor {
        get{
            return self.view.backgroundColor == nil ? Colors.white : self.view.backgroundColor!
        }
        set{
           self.view.backgroundColor = newValue
        }
    }
    
    public var bottomColor: UIColor {
        get{
            return self.bottomView.backgroundColor == nil ? Colors.white : self.bottomView.backgroundColor!
        }
        set{
            self.bottomView.backgroundColor = newValue
        }
    }
    
    override open func viewDidLoad() {
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
        
        view.addSubview(bottomView)
        
        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(mMainView.snp.bottom)
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.left.equalTo(self.view.snp.left).offset(0)
        }
        
        guard let controller = self as? EXRViewController else {
            return
        }
        
        controller.initView()
    }
    
    public func addHeaderView(){
        self.mainView.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.top.equalTo(mainView)
            make.right.equalTo(mainView)
            make.left.equalTo(mainView)
        }
        
        headerView.addSubview(backButton)
        backButton.snp.makeConstraints { (make) in
            make.left.equalTo(headerView).offset(15)
            make.centerY.equalTo(headerView)
        }
        
        headerView.addSubview(headerContainer)
        headerContainer.snp.makeConstraints { (make) in
            make.left.equalTo(backButton.snp.right)
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        backButton.rx.tap
            .asObservable()
            .timeout(.milliseconds(100), scheduler: MainScheduler.instance)
            .subscribe(onNext: { (_) in
                 self.navigationController?.popViewController(animated: true)
            }).disposed(by: disposeBag)
            
        
    }
    
    
    /// Show progress dialog
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
    
    
    /// Hide progress dialog
    public func hideProgress(){
        OperationQueue.main.addOperation {
            self.container.removeFromSuperview()
            self.activityIndicator.stopAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }

    ///Shows alert message
    public func showAlert(message:String, title:String = "Info", okTitle: String = "OK"){
        OperationQueue.main.addOperation {
            let alertController = UIAlertController(title: title, message:
                message, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: okTitle, style: UIAlertAction.Style.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    /// Helper method to display an alert on any UIViewController subclass. Uses UIAlertController to show an alert
    ///
    /// - Parameters:
    ///   - title: title of the alert
    ///   - message: message/body of the alert
    ///   - buttonTitles: (Optional)list of button titles for the alert. Default button i.e "OK" will be shown if this paramter is nil
    ///   - highlightedButtonIndex: (Optional) index of the button from buttonTitles that should be highlighted. If this parameter is nil no button will be highlighted
    ///   - completion: (Optional) completion block to be invoked when any one of the buttons is tapped. It passes the index of the tapped button as an argument
    /// - Returns: UIAlertController object (discardable).
    @discardableResult public func showAlert(title: String?, message: String?, buttonTitles: [String]? = nil, highlightedButtonIndex: Int? = nil, completion: ((Int) -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var allButtons = buttonTitles ?? [String]()
        if allButtons.count == 0 {
            allButtons.append("OK")
        }
        
        for index in 0..<allButtons.count {
            let buttonTitle = allButtons[index]
            let action = UIAlertAction(title: buttonTitle, style: .default, handler: { (_) in
                completion?(index)
            })
            alertController.addAction(action)
            // Check which button to highlight
            if let highlightedButtonIndex = highlightedButtonIndex, index == highlightedButtonIndex {
                if #available(iOS 9.0, *) {
                    alertController.preferredAction = action
                }
            }
        }
        present(alertController, animated: true, completion: nil)
        return alertController
    }
    
    /// Helper method to add a UIViewController as a childViewController.
    ///
    /// - Parameters:
    ///   - childViewController: the view controller to add as a child
    ///   - containerView: the containerView for the child viewcontroller's root view.
    public func addChildViewController(childViewController: UIViewController, containerView: UIView){
        let controller = childViewController
        //add as a childviewcontroller
        addChild(controller)
        // Add the child's View as a subview
        containerView.addSubview(controller.view)
        controller.view.frame = containerView.bounds
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // tell the childviewcontroller it's contained in it's parent
        controller.didMove(toParent: self)
    }
    
    /// Helper method to remove a UIViewController from its parent.
    public func removeViewAndControllerFromParentViewController() {
        guard parent != nil else { return }
        
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }

}
