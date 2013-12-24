//
//  RNJsonRequest.m
//  Pineapple
//
//  Created by Benjamin Maer on 4/14/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RNJsonRequest.h"
#import "RUConstants.h"
#import "RUDLog.h"

@implementation RNJsonRequest

-(void)didFinishRequestWithResponseData:(NSData *)responseData
{
    NSError* error = nil;
    id jsonResponse = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];

    if (error)
    {
        [self didFinishRequestWithJsonResponse:jsonResponse];
    }
    else
    {
        [self didFailRequestWithError:error];
    }
}

-(void)didFinishRequestWithJsonResponse:(id)responseJson
{
    RUDLog(@"%@",responseJson);
}

-(void)didFinishRequestWithJsonParsingError:(NSError*)error
{
    RUDLog(@"error: %@",error);
}

@end
