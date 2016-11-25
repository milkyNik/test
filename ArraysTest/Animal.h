//
//  Animal.h
//  ArraysTest
//
//  Created by iMac on 04.01.16.
//  Copyright © 2016 MilNik. All rights reserved.
//

#import "LivingCreatures.h"

typedef enum {
    Wild,Home
} AnimalType;

@interface Animal : LivingCreatures

@property (strong, nonatomic) NSString* nickname;
@property (assign, nonatomic) AnimalType type;

@end
