//
//  DBHelper.m
//  P2PQuizzer
//
//  Created by Udit Salwan on 25/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "DBHelper.h"
@interface DBHelper()
{
    NSManagedObjectModel			*_managedObjectModel;
    NSPersistentStoreCoordinator	*_persistentStoreCoordinator;
}
@end

@implementation DBHelper

+ (DBHelper*)sharedDBHelper
{
    static DBHelper *singleton = nil;
    
    static dispatch_once_t pred;        // Lock
    dispatch_once(&pred, ^{             // This code is called at most once per app
        singleton = [[DBHelper alloc] init];
    });
    
    return singleton;
}

-(id) init
{
    self = [super init];
    @synchronized(self)
    {
        NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
        [NSPersistentStoreCoordinator MR_setDefaultStoreCoordinator:coordinator];
        [NSManagedObjectContext MR_initializeDefaultContextWithCoordinator:coordinator];
        return self;
    }
}

//- (void)saveContext
//{
//    NSError *error = nil;
//    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
//    if (managedObjectContext != nil) {
//        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
//            // Replace this implementation with code to handle the error appropriately.
//            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//            abort();
//        }
//    }
//}

-(NSManagedObject *) modelForEntityName:(NSString *)entityName
{
    NSManagedObject *object =      [NSEntityDescription
                                    insertNewObjectForEntityForName:entityName
                                    inManagedObjectContext:[NSManagedObjectContext MR_defaultContext]];
    return object;
}

-(BOOL) saveObject:(NSManagedObject *)object
{
    __block BOOL saveStatus = FALSE;
    __block NSManagedObjectContext *localContext = [NSManagedObjectContext MR_defaultContext];
    [localContext   MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
        if (success) {
            saveStatus = TRUE;
        } else {
            if (error) {
                saveStatus = NO;
            }
        }
        localContext = nil;
    }];
    
    return YES;
}

-(NSMutableArray *) managedObjectsForModelClass:(Class)entityClass andPredicate:(NSPredicate *)predicate
{
    [MagicalRecord setErrorHandlerTarget:self action:@selector(handleCoreDataError)];
    NSMutableArray *data = nil;
    data = [NSMutableArray arrayWithArray:[entityClass MR_findAllWithPredicate: predicate]];
    return  data;
}


#pragma mark - Core Data stack
#pragma mark Methods from AppDelegate

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"P2PQuizzer" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"P2PQuizzer.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)handleCoreDataError
{
    NSLog(@"Error in core data operations");
}

@end
