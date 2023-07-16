//
//  MainViewController.swift
//  AnimalInfos
//
//  Created by Merve Nur Nerkis on 15.07.2023.
//

import UIKit
import AVKit
import AVFoundation

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var cheetahView: AView!
    @IBOutlet weak var giraffeView: AView!
    @IBOutlet weak var gorillaView: AView!
    @IBOutlet weak var hippoView: AView!
    @IBOutlet weak var lionView: AView!
    @IBOutlet weak var zebraView: AView!
    @IBOutlet weak var ostrichView: AView!
    @IBOutlet weak var elephantView: AView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Anasayfa"
        setupMyViews()
    }
    
    private func setupMyViews() {
        cheetahView.webLink = "https://en.wikipedia.org/wiki/Cheetah"
        giraffeView.webLink = "https://en.wikipedia.org/wiki/Giraffe"
        gorillaView.webLink = "https://en.wikipedia.org/wiki/Gorilla"
        hippoView.webLink = "https://en.wikipedia.org/wiki/Hippopotamus"
        lionView.webLink = "https://en.wikipedia.org/wiki/Lion"
        zebraView.webLink = "https://en.wikipedia.org/wiki/Zebra"
        ostrichView.webLink = "https://en.wikipedia.org/wiki/Common_ostrich"
        elephantView.webLink = "https://en.wikipedia.org/wiki/Elephant"
        cheetahView.goToLinkAction = routeWebVC()
        giraffeView.goToLinkAction = routeWebVC()
        gorillaView.goToLinkAction = routeWebVC()
        hippoView.goToLinkAction = routeWebVC()
        lionView.goToLinkAction = routeWebVC()
        zebraView.goToLinkAction = routeWebVC()
        ostrichView.goToLinkAction = routeWebVC()
        elephantView.goToLinkAction = routeWebVC()
        
        cheetahView.goToVideoAction = {
            self.playVideo("cheetah")
        }
        elephantView.goToVideoAction = {
            self.playVideo("elephant")
        }
        giraffeView.goToVideoAction = {
            self.playVideo("giraffe")
        }
        hippoView.goToVideoAction = {
            self.playVideo("hippo")
        }
        lionView.goToVideoAction = {
            self.playVideo("lion")
        }
        zebraView.goToVideoAction = {
            self.playVideo("zebra")
        }
        ostrichView.goToVideoAction = {
            self.playVideo("ostrich")
        }
        gorillaView.goToVideoAction = {
            self.playVideo("gorilla")
        }
    }
    
    func routeWebVC() -> (String) -> () {
        return { urlString in
            let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
            if let webVC = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
                webVC.urlString = urlString
                self.navigationController?.pushViewController(webVC, animated: true)
            }
        }
    }
    
    func playVideo(_ videoPath: String) {
        if let path = Bundle.main.path(forResource: videoPath, ofType: "mp4") {
            let player = AVPlayer(url: URL(filePath: path))
            let playerControl = AVPlayerViewController()
            playerControl.player = player
            
            self.present(playerControl, animated: true) {
                player.play()
            }
        }
    }
}





