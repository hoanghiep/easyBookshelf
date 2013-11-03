//
//  NSMutableArray+Extend.m
//  comic
//
//  Created by Tran Hoang Hiep on 11/2/13.
//  Copyright (c) 2013 Tran Hoang Hiep. All rights reserved.
//
#import "NSMutableArray+Extend.h"

@implementation NSMutableArray (Extend)

-(NSMutableArray*)arrayInRange:(NSInteger)index withLength:(NSInteger)length{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    int maxRange = [self numbersOfRangeWith:length];
    if(index >= maxRange) {
        return result;
    }
    int start = length * index;
    int total = [self count];
    if(start >= total){
        return result;
    }
    for(int i = start; i < start + length; i++){
        if(i >= total){
            [result addObject:[NSNull null]];
            continue;
        }
        [result addObject:[self objectAtIndex:i]];
    }
    return result;
}

-(NSInteger)numbersOfRangeWith:(NSInteger)length{
    int div = [self count] % length;
    int count = [self count]/length + (div== 0 ? 0 : 1);
//    NSLog(@"%d", count);
    return count;
}
@end
