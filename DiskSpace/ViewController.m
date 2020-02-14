//
//  ViewController.m
//  DiskSpace
//
//  Created by Hamid Jan on 21/01/2016.
//  Copyright © 2016 Hamid Jan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    IBOutlet UITableView *mainTablView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Changes for updated pod");
    NSLog(@"Changes for updated pod2");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    [cell.textLabel setText:@"Disk Space"];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
