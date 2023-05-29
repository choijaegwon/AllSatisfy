//
//  ContentViewModel.swift
//  AllSatisfy
//
//  Created by Jae kwon Choi on 2023/05/29.
//

import Combine
import Foundation

class ContentViewModel: ObservableObject {

    @Published var allMarketingTermAgreed: Bool = false
    @Published var emailMarketingAgreed: Bool = false
    @Published var phoneMarketingAgreed: Bool = false
    
    var subscriptions = Set<AnyCancellable>()

    init() {
        Publishers.CombineLatest($emailMarketingAgreed, $phoneMarketingAgreed)
            .sink { email, phone in
                self.allMarketingTermAgreed = [email, phone].allSatisfy { $0 == true }
                print(self.allMarketingTermAgreed)
            }
            .store(in: &self.subscriptions)
    }
    
    /// 모두 동의하기
    func allAgree() {
        if self.emailMarketingAgreed && self.phoneMarketingAgreed {
            self.emailMarketingAgreed = false
            self.phoneMarketingAgreed = false
        } else {
            self.emailMarketingAgreed = true
            self.phoneMarketingAgreed = true
        }
    }

}
