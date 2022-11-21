//
//  TravelAddViewModel.swift
//  Doesaegim
//
//  Created by 김민석 on 2022/11/16.
//

import Foundation

final class TravelAddViewModel: TravelAddViewProtocol {
    
    // MARK: - Properties
    
    weak var delegate: TravelAddViewDelegate?
    
    var isValidTextField: Bool
    var isValidDate: Bool
    var isValidInput: Bool {
        didSet {
            delegate?.travelAddFormDidChange(isValid: isValidInput)
        }
    }
    
    // MARK: - Lifecycles
    
    init() {
        isValidTextField = false
        isValidDate = false
        isValidInput = isValidTextField && isValidDate
    }
    
    // MARK: - Functions
    
    func travelTitleDidChanged(title: String?) {
        defer { isValidInput = isValidTextField && isValidDate }
        guard let title, !title.isEmpty else {
            isValidTextField = false
            return
        }
        isValidTextField = true
    }
    
    
    func travelDateTapped(dates: [String], completion: @escaping ((Bool) -> Void)) {
        defer {
            isValidInput = isValidTextField && isValidDate
            completion(isValidDate)
        }
        guard dates.count > 1 else {
            isValidDate = false
            return
        }
        isValidDate = true
        
    }
    
    // MARK: - CoreData Function
    
    func postTravel(travel: TravelDTO, completion: @escaping (() -> Void)) {
        do {
            try Travel.addAndSave(with: travel)
            completion()
        } catch {
            print(error.localizedDescription)
        }
    }
}
