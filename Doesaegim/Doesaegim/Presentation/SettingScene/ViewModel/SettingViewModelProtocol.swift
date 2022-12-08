//
//  SettingViewModelProtocol.swift
//  Doesaegim
//
//  Created by Jaehoon So on 2022/12/07.
//

import Foundation

protocol SettingViewModelProtocol {
    
    var settingInfos: [SettingSection] { get set }
    
    func configureSettingInfos()
    
}