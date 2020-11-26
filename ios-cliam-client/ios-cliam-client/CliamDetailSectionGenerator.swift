//  Created by XinW on 2020/11/25.
//
//  Copyright © 2020 XinW. All rights reserved.
//

import UIKit

class TitleSectionGenerator {
    func generate() -> UIStackView {
        let bStackView = UIStackView()
        bStackView.axis = .horizontal
        bStackView.distribution = .fill
        bStackView.spacing = 5
        let lbl = UILabel()
        lbl.text = "Please Enter Claim Information"
        lbl.textAlignment = .center
        lbl.sizeToFit()
        bStackView.addArrangedSubview(lbl)
        return bStackView
    }
}

class ClaimDetailSectionGenerator {
    
    func generate() -> UIStackView {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        
        var vGenerator: FieldValueViewGenerator!
        var sView: UIStackView
        vGenerator = FieldValueViewGenerator(n: "Cliam Title")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        
        vGenerator = FieldValueViewGenerator(n: "Date")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        
        // title
        let lblTitle = UILabel()
        lblTitle.text = "Please Enter Claim Information"
        lblTitle.textAlignment = .center
        
        return stackView
    }
}

class ButtonSectionGenerator {
    
    func generate() -> UIStackView {
        //
        let bStackView = UIStackView()
        bStackView.axis = .horizontal
        bStackView.distribution = .fill
        bStackView.spacing = 5
        let btn = UIButton()
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.gray, for: .highlighted)
        btn.backgroundColor = UIColor.blue
        bStackView.addArrangedSubview(btn)
        return bStackView
    }
}

class StatusSectionGenerator {
    func generate() -> UIStackView {
        let bStackView = UIStackView()
        bStackView.axis = .horizontal
        bStackView.distribution = .fill
        bStackView.spacing = 10
        var lbl: UILabel
        lbl = UILabel()
        lbl.text = "Status"
        lbl.sizeToFit()
        bStackView.addArrangedSubview(lbl)
        
        lbl = UILabel()
        lbl.text = "<Status Message>"
        lbl.sizeToFit()
        bStackView.addArrangedSubview(lbl)
        return bStackView
    }
}

class ClaimDetailScreenGenerator {
    var root: UIView!
    var titleSecView: UIStackView!
    var detailSecView: UIStackView!
    var buttonSecView: UIStackView!
    var statusSecView: UIStackView!
    
    var vals : [UITextField]!
    var lbls : [UILabel]!
    var btnAdd: UIButton!
    var labelSatus: UILabel!
    
    init(v : UIView) {
        root = v
    }

    func setViewReference() {
        vals = [UITextField]()
        lbls = [UILabel]()
        
        for sv in detailSecView.arrangedSubviews {
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews {
                if ve is UITextField {
                    vals.append(ve as! UITextField)
                } else {
                    lbls.append(ve as! UILabel)
                }
            }
        }
        print("UITextField references created.")
        
        // Make UITextField readonly
        for v in vals {
            v.isUserInteractionEnabled = true
        }
        
        //
        for sv in buttonSecView.arrangedSubviews {
            let btn = sv as! UIButton
            if btn.titleLabel?.text == "Add" {
                btnAdd = btn
            }
        }
        
        for sv in statusSecView.arrangedSubviews {
            let label = sv as! UILabel
            if (label.text != "Status") {
                labelSatus = label
            }
            
        }
    }
    
    func setTitleSecConstraints() {
        titleSecView.translatesAutoresizingMaskIntoConstraints = false
        let tpConst = titleSecView.topAnchor.constraint(equalTo: root.safeAreaLayoutGuide.topAnchor)
        let lConst = titleSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trConst = titleSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tpConst.constant = 16
        tpConst.isActive = true
        lConst.isActive = true
        trConst.isActive = true
    }
    
    func setDetailSecConstraints() {
        for i in 0...lbls.count-1 {
            lbls[i].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            lbls[i].setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        let constr = lbls[0].widthAnchor.constraint(equalToConstant: root.frame.width * 0.25)
        constr.isActive = true
        //
        for i in 0...lbls.count-1 {
            lbls[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = lbls[i].trailingAnchor.constraint(equalTo: lbls[0].trailingAnchor)
            constr.isActive = true
        }
        //
        for i in 0...vals.count-1 {
            //vals[i].setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            vals[i].setContentHuggingPriority(.defaultLow, for: .horizontal)
        }
        detailSecView.translatesAutoresizingMaskIntoConstraints = false
        let tCont = detailSecView.topAnchor.constraint(equalTo: titleSecView.safeAreaLayoutGuide.bottomAnchor)
        let lCont = detailSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trCont = detailSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tCont.constant = 16
        lCont.constant = 16
        trCont.constant = -16
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
    }
    
    func setButtonSecConstraints() {
        buttonSecView.translatesAutoresizingMaskIntoConstraints = false
        let tpConst = buttonSecView.topAnchor.constraint(equalTo: detailSecView.bottomAnchor)
        let lConst = buttonSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trConst = buttonSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tpConst.constant = 16
        lConst.constant = 16
        trConst.constant = -16
        tpConst.isActive = true
        lConst.isActive = true
        trConst.isActive = true
    }
    
    func setStatusSecConstraints() {
        statusSecView.translatesAutoresizingMaskIntoConstraints = false
        let tpConst = statusSecView.topAnchor.constraint(equalTo: buttonSecView.bottomAnchor)
        let lConst = statusSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trConst = statusSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tpConst.constant = 16
        lConst.constant = 16
        trConst.constant = -16
        lConst.isActive = true
        tpConst.isActive = true
        trConst.isActive = true
    }
    
    func generate() {
        //
        titleSecView = TitleSectionGenerator().generate()
        print("Title section was created. ")
        detailSecView = ClaimDetailSectionGenerator().generate()
        print("Detail section was created. ")
        buttonSecView = ButtonSectionGenerator().generate()
        print("Button section was created. ")
        statusSecView = StatusSectionGenerator().generate()
        root.addSubview(titleSecView)
        root.addSubview(detailSecView)
        root.addSubview(buttonSecView)
        root.addSubview(statusSecView)
        
        //
        setViewReference()
        print("setViewReference() called.")
        
        //
        setTitleSecConstraints()
        
        // set constraints for detailSecView
        setDetailSecConstraints()
        print("setDetailSecConstraints() called.")
        
        // set constraints for buttonSecView
        setButtonSecConstraints()
        print("setButtonSecConstraints() called.")
        
        setStatusSecConstraints()
    }
}
