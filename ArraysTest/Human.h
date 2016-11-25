//
//  Human.h
//  ArraysTest
//
//  Created by iMac on 04.01.16.
//  Copyright © 2016 MilNik. All rights reserved.
//

#import "LivingCreatures.h"

typedef enum {
    Man, Woman
} Gender;

@interface Human : LivingCreatures

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;
@property (assign, nonatomic) Gender gender;

@end
