//
//  NNAddressBook.h
//  NNAddressBookExample
//
//  Created by noughts on 2014/01/09.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

@interface NNAddressBook : NSObject

typedef void (^NNBooleanBlock)(BOOL success, NSError* error);

/// ロード
-(void)load:(NNBooleanBlock)block;

-(NSArray*)people;

@end
