//
//  NNAddressBookPerson.h
//  NNAddressBookExample
//
//  Created by noughts on 2014/01/09.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

@interface NNAddressBookPerson : NSObject

/// イニシャライザ
- (id)initWithRecord:(ABRecordRef)record;

/// RecordID取得
-(int)recordID;
-(UIImage*)image;
-(NSArray*)emails;
-(NSArray*)phoneNumbers;
-(NSString*)firstName;
-(NSString*)lastName;
-(NSString*)fullName;

@end
