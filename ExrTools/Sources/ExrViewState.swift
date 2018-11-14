//
//  ExrViewState.swift
//  ExrTools
//
//  Created by Attila Janosi on 14/11/2018.
//  Copyright © 2018 EXERA SOTDEVELOP SRL. All rights reserved.
//

import Foundation

class ExrViewState<T>{
    var data:T?
    var state:State
    var error:Error?
    
    init(){
        self.state = .INITIAL
        self.data = nil
        self.error = nil
    }
    
    init(data:T) {
        self.data = data
        self.state = .DONE
        self.error = nil
    }
    
    init(state:State) {
        self.data = nil
        self.state = state
        self.error = nil
    }
    
    init(error:Error) {
        self.data = nil
        self.state = .ERROR
        self.error = error
    }
    
}

enum State {
    case INITIAL
    case LOADING
    case DONE
    case ERROR
}

class Error{
    
    var message=""
    var code: Int = 0
    
    init(message: String) {
        self.message = message
    }
    
    init(message: String, code:Int) {
        self.message = message
        self.code = code
    }
}
