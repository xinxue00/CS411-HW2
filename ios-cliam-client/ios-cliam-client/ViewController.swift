//  Created on 2020/11/25

import UIKit

class ViewController: UIViewController {

    var detailScreenGenerator : ClaimDetailScreenGenerator!
    var claimService: ClaimService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //1. Create screen
        detailScreenGenerator = ClaimDetailScreenGenerator(v: view)
        print("Screen generator initialized. ")
        detailScreenGenerator.generate()
        
        claimService = ClaimService()
        
        detailScreenGenerator.btnAdd.addTarget(self, action: #selector(actionAdd), for: .touchUpInside)
    }

    @objc func actionAdd(_ sender: Any) {
        guard let title = detailScreenGenerator.vals[0].text else {
            return
        }
        guard let date = detailScreenGenerator.vals[1].text else {
            return
        }
        guard !title.isEmpty else {
            showAlert(message: "Claim Title should not be empty.")
            return
        }
        guard !date.isEmpty else {
            showAlert(message: "Date should not be empty.")
            return
        }
        let claim = Claim(title: title, date: date)
        
        detailScreenGenerator.btnAdd.isEnabled = false
        detailScreenGenerator.labelSatus.text = "<Status Message>"
        claimService.addClaim(claim) {
            self.detailScreenGenerator.btnAdd.isEnabled = true
            self.detailScreenGenerator.labelSatus.text = "Claim \(claim.title) was successfully created."
        } onFailure: {
            self.detailScreenGenerator.btnAdd.isEnabled = true
            self.detailScreenGenerator.labelSatus.text = "Claim \(claim.title) was failed created."
        }

    }
    
    func showAlert(message: String?) {
        let alert = UIAlertController(title: "Tip", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

