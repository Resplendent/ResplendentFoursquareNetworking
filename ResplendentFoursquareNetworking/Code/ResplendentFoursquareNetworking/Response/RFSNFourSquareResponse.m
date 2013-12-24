//
//  RFSNFourSquareResponse.m
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RFSNFourSquareResponse.h"





NSInteger const kRFSNFourSquareResponseSuccessCode = 200;





@implementation RFSNFourSquareResponse

-(NSDictionary *)meta
{
    return [self.responseDictionary objectForKey:@"meta"];
}

-(NSNumber *)code
{
    return [self.meta objectForKey:@"code"];
}

-(BOOL)successfulResponse
{
    return (self.code.integerValue == kRFSNFourSquareResponseSuccessCode);
}

@end
