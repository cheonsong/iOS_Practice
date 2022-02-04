//
//  ViewModel.swift
//  RxSwiftProject
//
//  Created by cheonsong on 2022/02/04.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    
    struct Input {
        var text : Observable<String>
        var tap : Observable<Void>
    }
    
    struct Output {
        var label : PublishRelay<String>
    }
    
    let label = PublishRelay<String>()
    
    func transform(input: Input) -> Output {

        input.text
            .bind(to: label)
            .disposed(by: DisposeBag())
        
        input.tap
            .withLatestFrom(input.text)
            .bind(to: label)
            .disposed(by: DisposeBag())
        
        return Output(label: label)
    }
}
