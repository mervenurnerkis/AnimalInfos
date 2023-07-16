//
//  AView.swift
//  AnimalInfos
//
//  Created by Merve Nur Nerkis on 15.07.2023.
//

import UIKit

class AView: UIView {
    
    var webLink: String?
    var videoPath: String?
    var goToLinkAction: ((_ urlString: String) -> ())?
    var goToVideoAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        if let viewForXib = Bundle.main.loadNibNamed("AView", owner: self)?[0] as? UIView {
            viewForXib.frame = self.bounds
            viewForXib.layer.cornerRadius = 20
            addSubview(viewForXib)
        }
    }
    
    @IBAction func goToLinkAct(_sender: Any) {
        goToLinkAction?(webLink!)
    }
    
    @IBAction func watcVideoAct(_ sender: Any) {
        goToVideoAction?()
    }
}
