//
//  LabeledTextInputView+TextView.swift
//  AmadaAlert
//
//  Created by IT Support on 12/14/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

extension LabeledTextInputView: UITextViewDelegate {

    func initTextView() {
        self.textView.delegate = self
    }

    func setTextViewText(text: String) {
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
    }

    func textViewDidEndEditing(_ textView: UITextView) {
    }
}
