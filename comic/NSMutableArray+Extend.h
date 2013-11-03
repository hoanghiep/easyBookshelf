//
//  NSMutableArray+Extend.h
//  comic
//
//  Created by Tran Hoang Hiep on 11/2/13.
//  Copyright (c) 2013 Tran Hoang Hiep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Extend)

/*
 Ví dụ cho 1 day 1 2 3 4 5 6 7 8 9
 Khi truyền vào arrayInRange: 1 withLength 3
 Hàm này sẽ phân nhóm dãy hiện tại thành nhiều dãy nhỏ với số phần tử mỗi nhóm mới là 3
 Sau đó đếm số thứ nhóm để lấy nhóm thứ 1 (đánh số nhóm bắt đầu từ 0)
 */
-(NSMutableArray*)arrayInRange:(NSInteger)index withLength:(NSInteger)length;

/*
 
 */
-(NSInteger)numbersOfRangeWith:(NSInteger)length;
@end
