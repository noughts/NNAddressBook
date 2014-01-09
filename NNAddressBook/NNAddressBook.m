//
//  NNAddressBook.m
//  NNAddressBookExample
//
//  Created by noughts on 2014/01/09.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NNAddressBook.h"
#import "NNAddressBookPerson.h"

@interface NNAddressBook()
@property NSMutableArray* _records;
@end

@implementation NNAddressBook

-(void)load:(NNBooleanBlock)block{
	self._records = [@[] mutableCopy];
	
	if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
		NSLog( @"未承認" );
		ABAddressBookRef book = NULL;
		ABAddressBookRequestAccessWithCompletion(book, ^(bool granted, CFErrorRef error) {
			NSLog( @"許可されました" );
			// ここでメインスレッドで実行しないと、block内のUI処理が反映されないのでGDCを使っています。
			// 参考: http://www.dosomethinghere.com/2012/10/08/ios-6-calendar-and-address-book-issues/
			dispatch_async(dispatch_get_main_queue(), ^{
				[self _loadAddressBook];
				block( YES, nil );
			});
		});
	} else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusRestricted || ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusDenied) {
		NSLog( @"許可されていません" );
		return;
	} else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
		NSLog( @"許可されています" );
		[self _loadAddressBook];
		block( YES, nil );
	}
}


-(void)_loadAddressBook{
	ABAddressBookRef book = ABAddressBookCreateWithOptions( NULL, NULL );
	CFArrayRef records = ABAddressBookCopyArrayOfAllPeople( book );
	
	int len = CFArrayGetCount( records );
	for( int i=0; i<len; i++ ){
		NNAddressBookPerson* person = [[NNAddressBookPerson alloc] initWithRecord:CFArrayGetValueAtIndex(records, i)];
		[self._records addObject:person];
	}
//	NSLog( @"%@", self._records );
}


-(NSArray*)people{
	return self._records;
}

@end
