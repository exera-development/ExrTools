//
//  ExrCheckBox.swift
//  ExrTools
//
//  Created by Attila Janosi on 06/11/2018.
//  Copyright © 2018 EXERA SOTDEVELOP SRL. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

public class ExrCheckBox: UIButton {
    private let disposeBag = DisposeBag()
    
    // Images
    private var mCheckedImage: UIImage?
    private var mUncheckedImage: UIImage?
    
    // Bool property
    public var checked: Bool {
        get{
            return self.isChecked.value
        }
        set{
            self.isChecked.accept(newValue)
            if(isChecked.value){
                self.setImage(mCheckedImage, for: UIControl.State.normal)
            }else{
                self.setImage(mUncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    private let isChecked =  BehaviorRelay<Bool>(value: false)
    public let rx = ExrReactiveCheckBox()
    
    public var text: String{
        get {
            return self.titleLabel?.text ?? ""
        }
        set{
            self.setTitle(newValue, for: .normal)
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        }
    }
    
    public var checkedImage: UIImage?{
        get{
            return self.mCheckedImage ?? nil
        }
        set{
            self.mCheckedImage = newValue
            if(isChecked.value){
                self.setImage(newValue, for: .normal)
            }
        }
    }
    
    public var unCheckedImage: UIImage?{
        get{
            return self.mUncheckedImage ?? nil
        }
        set{
            self.mUncheckedImage = newValue
            if(!isChecked.value){
                self.setImage(newValue, for: .normal)
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    private func initView() {
        rx.checked = self.isChecked
        self.rx.tap.bind {
            self.buttonClicked(sender: self)
            }.disposed(by: disposeBag)
        self.contentHorizontalAlignment = .left
        self.setTitle("", for: .normal)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let _ = mCheckedImage?.tint(with: Colors.colorAccent)
        let _ = mUncheckedImage?.tint(with: Colors.colorAccent)
        isChecked.asObservable().subscribe { (checked) in
            if(checked.element!){
                self.setImage(self.mCheckedImage, for: UIControl.State.normal)
            }else{
                self.setImage(self.mUncheckedImage, for: UIControl.State.normal)
            }
        }.disposed(by: disposeBag)
    }
    
    private func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked.accept(!isChecked.value) 
        }
    }
}
