import UIKit
import RxSwift
import RxCocoa

final class SearchViewController: UIViewController {

    @IBOutlet weak var txtSearchBar: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        txtSearchBar.rx.text.orEmpty
            .throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest { API.getResults(roadName: $0) }
            .map { RoadDataDTO }
            .observeOn(MainScheduler.instance)
            .bind(lblResult.text)
    }.disposed(by: disposeBag)
}
