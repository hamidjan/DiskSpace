//
//  DiskSpaceViewController.h
//  DiskSpace
//
//  Created by Hamid Jan on 21/01/2016.
//  Copyright © 2016 Hamid Jan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicPieChart.h"
#import "BevelPieChart.h"
#import "MIMColorClass.h"
#import "MIMFragmentedDoughNut.h"

@interface DiskSpaceViewController : UIViewController <MIMPieChartDelegate, FragmentedDoughNutDelegate> {
    IBOutlet UILabel                *totalDiskSpaceLabel;
    IBOutlet UILabel                *deviceFreeSpaceLabel;
    IBOutlet UILabel                *otherAppsSpaceLabel;
    IBOutlet UILabel                *appSpaceLabel;
    
    NSString                        *deviceFreeSpaceString;
    NSString                        *usedSpaceString;
    NSString                        *otherAppsSpaceString;
    NSString                        *appSpaceString;
    
    BevelPieChart                   *myPieChart1;
    MIMFragmentedDoughNut           *detailedDoughNut;
}

- (uint64_t)getFreeDiskspace;
- (unsigned long long int) documentsFolderSize;
- (unsigned long long int)getMPSize;

@end
