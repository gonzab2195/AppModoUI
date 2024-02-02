//
//  WalletTabButton.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 01/02/2024.
//

import UIKit



class WalletTabButton: UIButton {
    
    private var isSelectedTab: Bool = false
    private var tabText: String?
    
    var delegate: WalletTabBarProtocol?
    
    init(tabText: String, isSelectedTab: Bool = false){
        super.init(frame: .zero)
        self.tabText = tabText
        self.isSelectedTab = isSelectedTab
        self.configure(text: tabText, isSelectedTab: isSelectedTab)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(text: String, isSelectedTab: Bool){
        
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        self.layer.cornerRadius = 15
        self.setTitle(text, for: .normal)
        self.addTarget(self, action: #selector(self.toggleTab), for: .touchUpInside)
        
        setTabStatus()
        
    }
    
    private func setTabStatus(){
        self.backgroundColor = isSelectedTab ? UIColor(named: Colors.BLUE_CROSS_DARK) : UIColor(named: Colors.SECONDARY_GRAY_3)
        self.setTitleColor(isSelectedTab ? .white : UIColor(named: Colors.SECONDARY_GRAY_40), for: .normal)
    }
    
    func updateTabStatus(tabSelected: String){
        
        isSelectedTab = tabSelected == tabText!
        setTabStatus()
    }
    
    @objc func toggleTab(){
        
        self.delegate?.selectedTab(tabText: tabText!)
        
    }
    
}
