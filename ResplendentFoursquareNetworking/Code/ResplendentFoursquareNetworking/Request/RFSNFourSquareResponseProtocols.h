//
//  RFSNFourSquareResponseProtocols.h
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import <Foundation/Foundation.h>





@class RFSNFourSquareRequest;
@class RUFourSquareResponse;





@protocol RFSNFourSquareRequestDelegate <NSObject>

-(void)fourSquareRequest:(RFSNFourSquareRequest*)request didFinishWithResponse:(RUFourSquareResponse*)response;

@end
