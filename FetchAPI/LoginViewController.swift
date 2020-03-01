import UIKit
import RxSwift
import RxCocoa

final class LoginViewController: UIViewController {

    @IBOutlet weak var txtAppID: UITextField!
    @IBOutlet weak var txtAppKey: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnSend: UIButton!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        txtAppKey.rx.text.orEmpty // Observebale<String>
                .map { !$0.isEmpty } // Observeable<Bool>
                .subscribe(onNext: { [unowned self] (isEnabled) in
                self.btnSend.isEnabled = isEnabled
            }).disposed(by: disposeBag)

        btnSend.rx.tap
            .withLatestFrom(txtAppKey.rx.text.orEmpty)
            //.map { "Hello \($0)" } // Observeable<String>
            .subscribe(onNext: { [unowned self] text in
                self.lblMessage.text = text
            }).disposed(by: disposeBag)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

