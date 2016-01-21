//
//  Constant.h
//  DiskSpace
//
//  Created by Hamid Jan on 21/01/2016.
//  Copyright © 2016 Hamid Jan. All rights reserved.
//

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_6 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )667 ) < DBL_EPSILON )
#define IS_IPHONE_6P ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )736 ) < DBL_EPSILON )

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

#import "Anchor.h"
#import "AnchorInfo.h"
#import "MIMColor.h"
#import "MIMColorClass.h"
#import "LineInfoBox.h"
#import "YAxisBand.h"
#import "XAxisBand.h"
#import "MIM_MathClass.h"
#import "LineScrollView.h"
#import "MIMMeter.h"
#import "BarInfoBox.h"
#import "MIMProperties.h"
#import "MIMFloatingView.h"


#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#ifdef DEBUG
#define DEBUG_MODE 1
#endif

#ifndef DEBUG
#define DEBUG_MODE 0
#endif

#define X_AXIS_HEIGHT 100

typedef enum
{
    USERDEFINED=1,
    REDTINT,
    GREENTINT,
    BEIGETINT
    
}TINTCOLOR;


typedef enum{
    
    SQUAREFILLED=1,
    SQUAREBORDER=2,
    CIRCLEFILLED=3,
    CIRCLEBORDER=4,
    CIRCLE=5,//Circle with border as fill Color
    SQUARE=6,
    NONE=7,
    DEFAULT=8,
    
}ANCHORTYPE;


typedef enum
{
    GTYPE_USERDEFINED,
    GTYPE_DEFAULT,
    GTYPE_RADIAL,
    GTYPE_HLINEAR,
    GTYPE_VLINEAR,
    GTYPE_ALINEAR //AT SOME ANGLE BUT ITS LINEAR
    
}GRADIENTTYPE;


typedef enum
{
    ALIGNMENT_CENTER,
    ALIGNMENT_LEFT,
    ALIGNMENT_RIGHT,
    ALIGNMENT_TOP,
    ALIGNMENT_BOTTOM,
    
}ALIGNMENT;

typedef enum
{
    DIRECTION_LEFT,
    DIRECTION_RIGHT,
    DIRECTION_TOP,
    DIRECTION_BOTTOM,
    
}DIRECTION;




typedef enum
{
    mPIE_DETAIL_POPUP_TYPE1=1,
    mPIE_DETAIL_POPUP_TYPE2,
    mPIE_DETAIL_POPUP_TYPE3,
    mPIE_DETAIL_POPUP_TYPE4,
    mPIE_DETAIL_POPUP_TYPE5,
    mPIE_DETAIL_POPUP_USERDEFINED,
    
}PIE_DETAIL_POPUP_TYPE;


typedef enum
{
    POPUP_ARROW_WHITE=1,
    POPUP_ARROW_BLACK,
    
}POPUP_ARROW_TINT_STYLE;


typedef enum
{
    INFOBOX_STYLE1=1, // Default one without interaction
    INFOBOX_STYLE2,//Rotation of pie and translation of info box up and down
    INFOBOX_STYLE3,//Selected Pie becomes bigger and related label in info box flashes and highlights
    
}INFOBOX_STYLE;


typedef enum
{
    mPIE_BUBBLE_STYLE1=1,//Square
    mPIE_BUBBLE_STYLE2,//Circle
    mPIE_BUBBLE_STYLE3,//Square translates from Pie
    mPIE_BUBBLE_STYLE4,//Circle translates from Pie
    mPIE_BUBBLE_STYLE5,//Square fades In
    mPIE_BUBBLE_STYLE6,//Circle fades In
    mPIE_BUBBLE_STYLE7,//Show all by default.//User can hide them - fade them out
    //Later we can add more effects in disappearing/appearing
    
}PIE_BUBBLE_STYLE;



typedef enum
{
    XTitleStyle1=1,
    XTitleStyle2,
    XTitleStyle3,
    XTitleStyle4,
}XTitleStyle;


typedef enum
{
    WALL_PATTERN_STYLE1=1,
    WALL_PATTERN_STYLE2,
    WALL_PATTERN_STYLE3,
    WALL_PATTERN_STYLE4,
    WALL_PATTERN_STYLE5,
    WALL_PATTERN_STYLE_NONE,
}WALL_PATTERN_STYLE;


typedef enum
{
    NONE_GRADIENT_STYLE=0,
    VERTICAL_GRADIENT_STYLE, //UP
    VERTICAL_GRADIENT_STYLE_2, //DOWN
    HORIZONTAL_GRADIENT_STYLE,//LEFT
    HORIZONTAL_GRADIENT_STYLE_2,//RIGHT
    
}GRADIENT_STYLE;


typedef enum
{
    GLOSS_STYLE_1=1,
    GLOSS_STYLE_2,
    GLOSS_STYLE_3,
    GLOSS_STYLE_4,
    GLOSS_STYLE_5,
    GLOSS_NONE,
    
}GLOSS_STYLE;



typedef enum
{
    BAR_ANIMATION_VGROW_STYLE=1,
    
}BAR_ANIMATION_STYLE;

typedef enum
{
    BAR_LABEL_STYLE1=1,
    BAR_LABEL_STYLE2,
    
}BAR_LABEL_STYLE;


typedef enum
{
    BAR_GRAPH_STYLE_DEFAULT=0,
    BAR_GRAPH_STYLE_GROUPED,
    BAR_GRAPH_STYLE_STACKED,
    
}BAR_GRAPH_STYLE;



#define LINESCROLLVIEWTAG 1000
#define XBANDTAG 1001
#define YBANDTAG 1002