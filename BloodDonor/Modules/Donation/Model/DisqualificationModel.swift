import Foundation

struct DisqualificationModel: Hashable {
    var disqualificationDate: Date
    var nextDonationDate: Date
    
    init(disqualificationDate: Date, nextDonationDate: Date) {
        self.disqualificationDate = disqualificationDate
        self.nextDonationDate = nextDonationDate
    }
}
