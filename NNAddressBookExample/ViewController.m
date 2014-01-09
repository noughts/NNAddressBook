//
//  ViewController.m
//  NNAddressBookExample
//
//  Created by noughts on 2014/01/09.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "ViewController.h"
#import "NNAddressBook.h"
#import "NNAddressBookPerson.h"

@interface ViewController ()
@property NNAddressBook* addressBook;
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	
	self.addressBook = [NNAddressBook new];
	[self.addressBook load:^(BOOL success, NSError *error) {
		NSLog( @"ロード完了! %d", self.addressBook.people.count );
		[self.tableView reloadData];
	}];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.addressBook.people.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	
	NNAddressBookPerson* person = self.addressBook.people[indexPath.row];
	cell.imageView.image = person.image;
	cell.textLabel.text = person.fullName;
	
	NSLog( @"%@ %@ %d", person.emails, person.phoneNumbers, person.recordID );
	
	return cell;
}









- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
