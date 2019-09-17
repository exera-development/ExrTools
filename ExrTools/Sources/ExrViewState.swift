//
//  ExrViewState.swift
//  ExrTools
//
//  Created by Attila Janosi on 14/11/2018.
//  Copyright © 2018 EXERA SOTDEVELOP SRL. All rights reserved.
//

import Foundation

public class ExrViewState<T>{
    public var data: T?
    public var state: State
    public var error: ExrError?
    
    public init(){
        self.state = .INITIAL
        self.data = nil
        self.error = nil
    }
    
    public init(data: T) {
        self.data = data
        self.state = .DONE
        self.error = nil
    }
    
    public init(state: State) {
        self.data = nil
        self.state = state
        self.error = nil
    }
    
    public init(error: ExrError) {
        self.data = nil
        self.state = .ERROR
        self.error = error
    }
    
}

public enum State {
    case INITIAL
    case LOADING
    case DONE
    case ERROR
}

public class ExrError{
    
    public var message=""
    public var code: Int = 0
    
    public init(message: String) {
        self.message = message
    }
    
    public init(message: String, code:Int) {
        self.message = message
        self.code = code
    }
}
