//
//  ViewPresenter.swift
//  MVCSample
//
//  Created by 中村太郎 on 2023/11/13.
//

import Foundation

protocol ViewPresenter: AnyObject {
    init(view: View)
    func task1Api() async -> String
    func task2Api() async -> String
    func allRunApi()
}

final class MVCViewPresenter: ViewPresenter {
    private weak var view: View?
    
    init(view: View) {
        self.view = view
    }
    
    func task1Api() async -> String {
        sleep(3)
        return "task1"
    }
    
    func task2Api() async -> String {
        sleep(3)
        return "task2"
    }
    
    func allRunApi() {
        Task.detached {
            DispatchQueue.main.async {
                self.view?.showLoading()
            }
            let data1 = await self.task1Api()
            let data2 = await self.task2Api()
            DispatchQueue.main.async {
                self.view?.hideLoading()
                self.view?.setData(data1: data1, data2: data2)
            }
        }
    }
}


