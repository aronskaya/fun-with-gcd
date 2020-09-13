//
//  Task5UpdateUI.swift
//  Command-Line Tool
//
//  Created by aronskaya on 19.08.2020.
//  Copyright © 2020 aronskaya. All rights reserved.
//

import UIKit

// can we call main.sync?
// will we deadlock?
// check!

func task5UpdateUI(label: UILabel) {
    background.async {
        let emoticon = randomEmoticon()

        DispatchQueue.main.async {
            label.text = emoticon
        }
    }
}

