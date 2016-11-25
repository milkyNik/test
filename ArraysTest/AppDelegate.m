//
//  AppDelegate.m
//  ArraysTest
//
//  Created by iMac on 04.01.16.
//  Copyright © 2016 MilNik. All rights reserved.
//

#import "AppDelegate.h"

#import "Bicycler.h"
#import "Runner.h"
#import "Swimmer.h"
#import "Neo.h"

#import "Cat.h"
#import "Dog.h"
#import "Horse.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
#pragma mark - Humans
    
    Bicycler* bicycler = [[Bicycler alloc] init];
    Runner* runner = [[Runner alloc] init];
    Swimmer* swimmer = [[Swimmer alloc] init];
    Neo* man = [[Neo alloc] init];
    
    bicycler.name = @"Den";
    bicycler.height = 1.75f;
    bicycler.weight = 70.5f;
    bicycler.gender = Man;
    
    runner.name = @"Nata";
    runner.height = 1.65f;
    runner.weight = 55.f;
    runner.gender = Woman;
    
    swimmer.name = @"Nik";
    swimmer.height = 1.74f;
    swimmer.weight = 82.f;
    swimmer.gender = Man;
    
    man.name = @"Thomas";
    man.lastName = @"Anderson";
    man.height = 1.8f;
    man.weight = 75.f;
    man.gender= Man;
    
#pragma mark - Animals
    
    Cat* cat = [[Cat alloc] init];
    Dog* dog = [[Dog alloc] init];
    Horse* horse = [[Horse alloc] init];
    
    [cat setNickname:@"Alisa"];
    [cat setType:Home];
    
    [dog setNickname:@"Funt"];
    [dog setType:Home];
    
    [horse setNickname:@"Tomy"];
    [horse setType:Wild];

    /*
     // MASTER
     
    NSArray* ark = [NSArray arrayWithObjects:bicycler, dog, runner, man, cat, horse, swimmer, nil];
    
    for (LivingCreatures* object in ark) {
        if ([object isKindOfClass:[Animal class]]) {
            
            NSLog(@"IS ANIMAL!");
            Animal* animal = (Animal*)object;
            NSLog(@"%@ %@ animal",[animal nickname],[animal type] ? @"home":@"wild");
            
        } else if ([object isKindOfClass:[Human class]]) {
            
            NSLog(@"IS HUMAN!");
            
            if ([object isKindOfClass:[Neo class]]) {
                
                Neo* neo = (Neo*)object;
                NSLog(@"Name: %@, last name: %@, height = %.2f m, weight = %.2f kg, gender: %@", [neo name], [neo lastName], [neo height], [neo weight], [neo gender] ? @"Woman":@"Man");
            } else {
                
                Human* human = (Human*)object;
                NSLog(@"Name: %@, height = %.2f m, weight = %.2f kg, gender: %@", [human name], [human height], [human weight], [human gender] ? @"Woman":@"Man");
            }
        }
        
        [object action];
        NSLog(@"\n");
        
    }
     
     */
    
    /*
     // STAR
    
    NSArray* humans = [NSArray arrayWithObjects:bicycler, runner, man, swimmer, bicycler, swimmer, nil];
    NSArray* animals = [NSArray arrayWithObjects:dog, cat, nil];
    
    NSInteger maxCount = [humans count] > [animals count] ? [humans count] : [animals count];
   
    for (int i = 0; i < maxCount; i++) {
        if (i < [humans count]) {
            
            NSLog(@"IS HUMAN!");
            
            if ([[humans objectAtIndex:i] isKindOfClass:[Neo class]]) {
                
                Neo* neo = (Neo*)[humans objectAtIndex:i];
                NSLog(@"Name: %@, last name: %@, height = %.2f m, weight = %.2f kg, gender: %@", [neo name], [neo lastName], [neo height], [neo weight], [neo gender] ? @"Woman":@"Man");
            } else {
                
                Human* human = (Human*)[humans objectAtIndex:i];
                NSLog(@"Name: %@, height = %.2f m, weight = %.2f kg, gender: %@", [human name], [human height], [human weight], [human gender] ? @"Woman":@"Man");
            }
            
            [(Human*)[humans objectAtIndex:i] action];
 
        }
        
        if (i < [animals count]) {

            NSLog(@"IS ANIMAL!");
            
            Animal* animal = (Animal*)[animals objectAtIndex:i];
            NSLog(@"%@ %@ animal",[animal nickname],[animal type] ? @"home":@"wild");
            
            [(Animal*)[animals objectAtIndex:i] action];
            
        }
        
        NSLog(@"\n");
        
    }
    */
    
    // SUPERMAN
    
    NSArray* ark = [NSArray arrayWithObjects:bicycler, dog, runner, man, cat, horse, swimmer, cat, nil];
    
    [self printArray:ark];
    
    NSLog(@"\n");
    NSLog(@"\n");
    NSLog(@"\n");
    
    NSArray* sortedArray = [self sortHumansAndAnimals:ark];
    
    [self printArray:sortedArray];
    
    return YES;
}

- (NSArray*) sortHumansAndAnimals:(NSArray*) array {
    
    NSArray* arrayHumanAnimal = [array sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj2 isKindOfClass:[Human class]]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 isKindOfClass:[Animal class]]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSArray* sortArray = [arrayHumanAnimal sortedArrayUsingComparator:^(id obj1, id obj2) {
        
        if ([obj1 isKindOfClass:[Human class]] && [obj2 isKindOfClass:[Human class]]) {
            
            if ([obj1 name] > [obj2 name]) {
                return (NSComparisonResult)NSOrderedDescending;
            } else {
                return (NSComparisonResult)NSOrderedAscending;
            }
        }
        
        if ([obj1 isKindOfClass:[Animal class]] && [obj2 isKindOfClass:[Animal class]]) {
            
            if ([obj1 nickname] > [obj2 nickname]) {
                return (NSComparisonResult)NSOrderedDescending;
            } else {
                return (NSComparisonResult)NSOrderedAscending;
            }
        }
        
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    return sortArray;
    
}

- (void) printArray:(NSArray*) myArray {
    
    for (LivingCreatures* object in myArray) {
        if ([object isKindOfClass:[Animal class]]) {
            
            NSLog(@"IS ANIMAL!");
            Animal* animal = (Animal*)object;
            NSLog(@"%@ %@ animal",[animal nickname],[animal type] ? @"home":@"wild");
            
        } else if ([object isKindOfClass:[Human class]]) {
            
            NSLog(@"IS HUMAN!");
            
            if ([object isKindOfClass:[Neo class]]) {
                
                Neo* neo = (Neo*)object;
                NSLog(@"Name: %@, last name: %@, height = %.2f m, weight = %.2f kg, gender: %@", [neo name], [neo lastName], [neo height], [neo weight], [neo gender] ? @"Woman":@"Man");
            } else {
                
                Human* human = (Human*)object;
                NSLog(@"Name: %@, height = %.2f m, weight = %.2f kg, gender: %@", [human name], [human height], [human weight], [human gender] ? @"Woman":@"Man");
            }
        }
        
        [object action];
        NSLog(@"\n");
        
    }
   
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
