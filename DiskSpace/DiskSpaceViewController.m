//
//  DiskSpaceViewController.m
//  DiskSpace
//
//  Created by Hamid Jan on 21/01/2016.
//  Copyright © 2016 Hamid Jan. All rights reserved.
//

#import "DiskSpaceViewController.h"
#import "Constant.h"
#import "AppDelegate.h"

@interface DiskSpaceViewController ()

@end

@implementation DiskSpaceViewController

#pragma mark - Default Init methods -

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Disk Space";
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"the free space is %llu MB \n\n",[self getFreeDiskspace]);
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        myPieChart1=[[BevelPieChart alloc]initWithFrame:CGRectMake(184, 184, 600, 560)];
    }
    else {
        myPieChart1=[[BevelPieChart alloc]initWithFrame:CGRectMake(55, 92, 230, 220)];
    }
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    float x = screenRect.origin.x + screenRect.size.width/2;
    [myPieChart1 setFrame:CGRectMake(x - myPieChart1.frame.size.width/2.0f, totalDiskSpaceLabel.frame.size.height + 10.0f , myPieChart1.frame.size.width, myPieChart1.frame.size.height)];
    myPieChart1.delegate=self;
    myPieChart1.tint=USERDEFINED;
    [myPieChart1 drawPieChart];
    [self.view addSubview:myPieChart1];
    [self labelColorsForPie:myPieChart1];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotate {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    float x = screenRect.origin.x + screenRect.size.width/2;
    [myPieChart1 setFrame:CGRectMake(x - myPieChart1.frame.size.width/2.0f, totalDiskSpaceLabel.frame.size.height + 10.0f , myPieChart1.frame.size.width, myPieChart1.frame.size.height)];
    
    return YES;
}

#pragma mark - Instance Methods -

- (uint64_t)getFreeDiskspace {
    uint64_t totalSpace = 0.0f;
    uint64_t totalFreeSpace = 0.0f;
    uint64_t usedSpace = 0.0f;
    NSError *error = nil;  
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];  
    
    if (dictionary) {  
        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemSize];  
        NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
        totalSpace = [fileSystemSizeInBytes floatValue];
        totalFreeSpace = [freeFileSystemSizeInBytes floatValue];
        usedSpace = totalSpace - totalFreeSpace;
        
        totalDiskSpaceLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Total Disk Space: %.02f GB",nil), (((totalSpace/1024.0f)/1024.0f)/1024.0f)];
        
        deviceFreeSpaceString     = [NSString stringWithFormat:@"%.02f",(((totalFreeSpace/1024.0f)/1024.0f)/1024.0f)];
        deviceFreeSpaceLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Free Disk Space: %@ GB",nil),deviceFreeSpaceString];

        otherAppsSpaceString     = [NSString stringWithFormat:@"%.02f",((((usedSpace- [self getMPSize])/1024.0f)/1024.0f)/1024.0f)];
        otherAppsSpaceLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Other Apps Space: %@ GB",nil),otherAppsSpaceString];
        
        appSpaceString     = [NSString stringWithFormat:@"%.02f",(([self getMPSize])/1048576.0f)/1024.0f];
        appSpaceLabel.text = [NSString stringWithFormat:NSLocalizedString(@"App Size: %@ GB",nil),appSpaceString];
        
        NSLog(@"Memory Capacity of %llu GB with %llu GB Free memory available.", (((totalSpace/1024ll)/1024ll)/1024ll), (((totalFreeSpace/1024ll)/1024ll))/1024ll);
    } 
    else 
    {  
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", [error domain], (long)[error code]);  
    }  
    
    return totalFreeSpace;
}

- (unsigned long long int) documentsFolderSize {
    NSFileManager *_manager = [NSFileManager defaultManager];
    NSArray *_documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *_documentsDirectory = [_documentPaths objectAtIndex:0];
    
    NSArray *_documentsFileList;
    NSEnumerator *_documentsEnumerator;
    NSString *_documentFilePath;
    
    unsigned long long int _documentsFolderSize = 0;
    
    _documentsFileList = [_manager subpathsAtPath:_documentsDirectory];
    _documentsEnumerator = [_documentsFileList objectEnumerator];
    
    while (_documentFilePath = [_documentsEnumerator nextObject]) {
        NSDictionary *_documentFileAttributes = [_manager attributesOfItemAtPath:[_documentsDirectory stringByAppendingPathComponent:_documentFilePath] error:nil];
        _documentsFolderSize += [_documentFileAttributes fileSize];
    }
    
    return _documentsFolderSize;
}

- (unsigned long long int)getMPSize {
//    NSString  *sizeTypeW = @"bytes";
    
    unsigned long long int working = [self documentsFolderSize];
    
    return working;
}

- (void)labelColorsForPie: (id)pieChart {
    [deviceFreeSpaceLabel setTextColor:[UIColor colorWithRed:232.0f/255.0f green: 232.0f/255.0f blue: 232.0f/255.0f alpha: 1.0f]];
    [otherAppsSpaceLabel setTextColor:[UIColor colorWithRed:174.0f/255.0f green: 174.0f/255.0f blue: 174.0f/255.0f alpha: 1.0f]];
    [appSpaceLabel setTextColor:[UIColor colorWithRed:50.0f/255.0f green: 200.0f/255.0f blue: 240.0f/255.0f alpha: 1.0f]];
}

#pragma mark - DOUGHNUT DELEGATE METHODS
-(float)innerRadiusForDoughNut:(id)doughnut
{
    return 150;
}
-(float)outerRadiusForDoughNut:(id)doughnut
{
    return 200;
}
-(NSArray *)valuesForDoughNut:(id)doughnut
{
    return [NSArray arrayWithObjects:deviceFreeSpaceString, otherAppsSpaceString, appSpaceString, nil];
}
-(NSArray *)titlesForDoughNut:(id)doughnut
{
    return [NSArray arrayWithObjects:@"Free Space",@"Others",@"App", nil];
}
-(NSArray *)colorsForDoughNut:(id)doughnut
{
    NSArray *colorsArray;
    
    MIMColorClass *color1 = [MIMColorClass colorWithComponent:@"232,232,232"];
    MIMColorClass *color2 = [MIMColorClass colorWithComponent:@"174,174,174"];
    MIMColorClass *color3 = [MIMColorClass colorWithComponent:@"50,200,240"];
    
    colorsArray = [NSArray arrayWithObjects:color1, color2, color3, nil];
    
    return colorsArray;
    
}

#pragma mark - PIECHART Delegate methods -

- (float)radiusForPie:(id)pieChart {
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        return 200.0f;
    }
    return 100.0f;
}

- (MIMColorClass *)colorForBackground:(id)pieChart {
    MIMColorClass *color = [MIMColorClass colorWithComponent:@"0,0,0,0"];
    return color;
}

- (NSArray *)colorsForPie:(id)pieChart {
    NSArray *colorsArray;
    
    MIMColorClass *color1 = [MIMColorClass colorWithComponent:@"232,232,232"];
    MIMColorClass *color2 = [MIMColorClass colorWithComponent:@"174,174,174"];
    MIMColorClass *color3 = [MIMColorClass colorWithComponent:@"50,200,240"];
    
    colorsArray = [NSArray arrayWithObjects:color1, color2, color3, nil];
    
    return colorsArray;
}

- (NSArray *)valuesForPie:(id)pieChart {
    return [NSArray arrayWithObjects:deviceFreeSpaceString, otherAppsSpaceString, appSpaceString, nil];
}

@end
