//
//  MyStyleKit.h
//  ProjectName
//
//  Created by AuthorName on 23/11/14.
//  Copyright (c) 2014 CompanyName. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface MyStyleKit : NSObject

// iOS Controls Customization Outlets
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* todayIconTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* boxIconTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* extrasTargets;

// Colors
+ (UIColor*)iconColor;

// Generated Images
+ (UIImage*)imageOfTodayIcon;
+ (UIImage*)imageOfBoxIcon;
+ (UIImage*)imageOfExtras;

@end