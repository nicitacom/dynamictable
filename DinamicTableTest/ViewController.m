//
//  ViewController.m
//  DinamicTableTest
//
//  Created by Никита on 12.03.15.
//  Copyright (c) 2015 Nikita Minakov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets insert = UIEdgeInsetsMake(20, 0, 0, 0);
    
    self.tableView.contentInset = insert;
    self.tableView.scrollIndicatorInsets = insert;
    
    

}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    NSLog(@"numberOfSectionInTableView");
    return [[UIFont familyNames] count];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    
    
    NSLog(@"numberOfRowsInSection %d",(int) section);
    NSArray* familyNames = [UIFont familyNames];
    
    NSString* familyName = [familyNames objectAtIndex:section];
    
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    return [fontNames count];

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray* familyNames = [UIFont familyNames];
    
    NSString* familyName = [familyNames objectAtIndex:section];
    
    return familyName;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellForRowAtIndexPath: {%d %d}", (int)indexPath.section, (int)indexPath.row);
    
    static NSString* identifier = @"Cell";

    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        NSLog(@"Cell created");
        
    } else {
        NSLog(@"Cell reused");

    }
    
    NSArray* familyNames = [UIFont familyNames];
    
    NSString* familyName = [familyNames objectAtIndex:indexPath.section];
    
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    NSString* fontName = [fontNames objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fontName;
    
    UIFont* font = [UIFont fontWithName:fontName size:16];
    
    cell.textLabel.font = font;
    
    NSLog("kncidci");//jbhjjbjbjbj
    
    return cell;
    
}



@end
