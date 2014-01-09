//
//  NNAddressBookPerson.m
//  NNAddressBookExample
//
//  Created by noughts on 2014/01/09.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NNAddressBookPerson.h"

@interface NNAddressBookPerson()
@property ABRecordRef recordRef;
@end

@implementation NNAddressBookPerson


/// イニシャライザ
- (id)initWithRecord:(ABRecordRef)record{
    self = [super init];
    if (self != nil) {
        self.recordRef = record;
    }
    return self;
}

/// RecordID取得
-(int)recordID{
	return ABRecordGetRecordID( self.recordRef );
}

/// アイコン画像取得
-(UIImage*)image{
	return [UIImage imageWithData:(__bridge_transfer NSData *)ABPersonCopyImageData(self.recordRef)];
}

/// メアド取得
-(NSArray*)emails{
	ABMultiValueRef ref = ABRecordCopyValue( self.recordRef, kABPersonEmailProperty );
	NSArray* emails = (__bridge_transfer NSArray *)ABMultiValueCopyArrayOfAllValues( ref );
//	NSLog( @"%@", emails );
	return emails;
}

/// 電話番号取得
-(NSArray*)phoneNumbers{
	ABMultiValueRef ref = ABRecordCopyValue( self.recordRef, kABPersonPhoneProperty );
	NSArray* phoneNumbers = (__bridge_transfer NSArray *)ABMultiValueCopyArrayOfAllValues( ref );
//	NSLog( @"%@", phoneNumbers );
	return phoneNumbers;
}

/// 名前取得
-(NSString*)firstName{
	return (__bridge_transfer NSString *)ABRecordCopyValue( self.recordRef, kABPersonFirstNameProperty );
}

/// 苗字取得
-(NSString*)lastName{
	return (__bridge_transfer NSString *)ABRecordCopyValue( self.recordRef, kABPersonLastNameProperty );
}

/// フルネーム取得
-(NSString*)fullName{
	NSMutableString* str = [@"" mutableCopy];
	if( self.firstName ){
		[str appendString:self.firstName];
		[str appendString:@" "];
	}
	if( self.lastName ){
		[str appendString:self.lastName];
		[str appendString:@" "];
	}
	return str;
}

@end
