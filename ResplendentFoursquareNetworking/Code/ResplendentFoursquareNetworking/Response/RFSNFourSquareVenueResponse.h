//
//  RFSNFourSquareVenueResponse.h
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RFSNFourSquareResponse.h"





@class RFSNFourSquareVenue;





@interface RFSNFourSquareVenueResponse : RFSNFourSquareResponse

@property (nonatomic, readonly) RFSNFourSquareVenue* venue;

@end
