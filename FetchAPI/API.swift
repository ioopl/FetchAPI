import RxSwift

final class API {
    class func getResults(roadName: String) -> Single<RoadDataDTO> {
        let roadDataDto = RoadDataDTO(displayName: "A2", statusSeverity: "Good")
        return roadDataDto.asObservable()
    }
}

public struct RoadDataDTO: Codable, Equatable {
    let displayName: String?
    let statusSeverity: String?
}
