//
//  RFSNFourSquareRequest.h
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RNJsonRequest.h"
#import "RFSNFourSquareResponseProtocols.h"





@interface RFSNFourSquareRequest : RNJsonRequest

@property (nonatomic, assign) id<RFSNFourSquareRequestDelegate>delegate;

//Must be overloaded by sublcass
+(Class)responseClass;

@end
