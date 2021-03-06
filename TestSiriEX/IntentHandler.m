//
//  IntentHandler.m
//  TestSiriEX
//
//  Created by 邓杰豪 on 2016/6/28.
//  Copyright © 2016年 邓杰豪. All rights reserved.
//

#import "IntentHandler.h"

// As an example, this class is set up to handle the Workout intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Start my workout using <myApp>"
// "Pause my workout using <myApp>"
// "Resume my workout using <myApp>"
// "Cancel my workout using <myApp>"
// "End my workout using <myApp>"

@interface IntentHandler () <INStartWorkoutIntentHandling, INPauseWorkoutIntentHandling, INResumeWorkoutIntentHandling, INCancelWorkoutIntentHandling, INEndWorkoutIntentHandling,INSendMessageIntentHandling>

@end

@implementation IntentHandler

- (id)handlerForIntent:(INIntent *)intent {
    // This is the default implementation.  If you want different objects to handle different intents,
    // you can override this and return the handler you want for that particular intent.
    
    id handler = nil;
    
    // You can substitute other objects for self based on the specific intent.
    if ([intent isKindOfClass:[INStartWorkoutIntent class]]||[intent isKindOfClass:[INPauseWorkoutIntent class]]||[intent isKindOfClass:[INResumeWorkoutIntent class]]||[intent isKindOfClass:[INCancelWorkoutIntent class]]||[intent isKindOfClass:[INEndWorkoutIntent class]]||[intent isKindOfClass:[INSendMessageIntent class]])
    {
        handler = self;
    }
    
    return handler;
}

#pragma mark - INStartWorkoutIntentHandling

// Implement resolution methods to provide additional information about your intent (optional).

- (void)resolveIsOpenEndedForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INBooleanResolutionResult * _Nonnull))completion {
    INBooleanResolutionResult *resolutionResult = [INBooleanResolutionResult successWithResolvedValue:NO];
    completion(resolutionResult);
}

- (void)resolveGoalValueForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INDoubleResolutionResult * _Nonnull))completion {
    INDoubleResolutionResult *resolutionResult = [INDoubleResolutionResult successWithResolvedValue:5];
    completion(resolutionResult);
}

- (void)resolveWorkoutGoalUnitTypeForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INWorkoutGoalUnitTypeResolutionResult * _Nonnull))completion {
    INWorkoutGoalUnitTypeResolutionResult *resolutionResult = [INWorkoutGoalUnitTypeResolutionResult successWithResolvedValue:INWorkoutGoalUnitTypeMinute];
    completion(resolutionResult);
}

- (void)resolveWorkoutLocationTypeForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INWorkoutLocationTypeResolutionResult * _Nonnull))completion {
    INWorkoutLocationTypeResolutionResult *resolutionResult = [INWorkoutLocationTypeResolutionResult successWithResolvedValue:INWorkoutLocationTypeIndoor];
    completion(resolutionResult);
}

- (void)resolveWorkoutNameForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INStringResolutionResult * _Nonnull))completion {
    INStringResolutionResult *resolutionResult = [INStringResolutionResult successWithResolvedString:@"Running"];
    completion(resolutionResult);
}

// Once resolution is completed, perform validation on the intent and provide confirmation (optional).

- (void)confirmStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent completion:(void (^)(INStartWorkoutIntentResponse * _Nonnull))completion {
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INStartWorkoutIntent class])];
    INStartWorkoutIntentResponse *response = [[INStartWorkoutIntentResponse alloc] initWithCode:INStartWorkoutIntentResponseCodeSuccess userActivity:userActivity];
    completion(response);
}

// Handle the completed intent (required).

- (void)handleStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent completion:(void (^)(INStartWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to start a workout here.
    
    // Update application state by updating NSUserActivity.
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INStartWorkoutIntent class])];
    INStartWorkoutIntentResponse *response = [[INStartWorkoutIntentResponse alloc] initWithCode:INStartWorkoutIntentResponseCodeSuccess userActivity:userActivity];
    completion(response);
}

// Implement handlers for each intent you wish to handle.  As an example for workouts, you may wish to handle pause, resume, cancel, and end.

#pragma mark - INPauseWorkoutIntentHandling

- (void)handlePauseWorkout:(INPauseWorkoutIntent *)pauseWorkoutIntent completion:(void (^)(INPauseWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to pause a workout here.
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INPauseWorkoutIntent class])];
    INPauseWorkoutIntentResponse *response = [[INPauseWorkoutIntentResponse alloc] initWithCode:INPauseWorkoutIntentResponseCodeSuccess userActivity:userActivity];
    completion(response);
}

#pragma mark - INResumeWorkoutIntentHandling

- (void)handleResumeWorkout:(INResumeWorkoutIntent *)resumeWorkoutIntent completion:(void (^)(INResumeWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to resume a workout here.
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INResumeWorkoutIntent class])];
    INResumeWorkoutIntentResponse *response = [[INResumeWorkoutIntentResponse alloc] initWithCode:INResumeWorkoutIntentResponseCodeSuccess userActivity:userActivity];
    completion(response);
}

#pragma mark - INCancelWorkoutIntentHandling

- (void)handleCancelWorkout:(INCancelWorkoutIntent *)cancelWorkoutIntent completion:(void (^)(INCancelWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to cancel a workout here.
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INCancelWorkoutIntent class])];
    INCancelWorkoutIntentResponse *response = [[INCancelWorkoutIntentResponse alloc] initWithCode:INCancelWorkoutIntentResponseCodeSuccess userActivity:userActivity];
    completion(response);
}

#pragma mark - INEndWorkoutIntentHandling

- (void)handleEndWorkout:(INEndWorkoutIntent *)endWorkoutIntent completion:(void (^)(INEndWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to end a workout here.
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INEndWorkoutIntent class])];
    INEndWorkoutIntentResponse *response = [[INEndWorkoutIntentResponse alloc] initWithCode:INEndWorkoutIntentResponseCodeSuccess userActivity:userActivity];
    completion(response);
}

#pragma mark --------------->INSendMessageIntentHandling
-(void)handleSendMessage:(INSendMessageIntent *)intent completion:(void (^)(INSendMessageIntentResponse * _Nonnull))completion
{
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INSendMessageIntent class])];
    INSendMessageIntentResponse *reponse = [[INSendMessageIntentResponse alloc] initWithCode:INSendMessageIntentResponseCodeSuccess userActivity:userActivity];
    completion(reponse);
}

-(void)resolveContentForSendMessage:(INSendMessageIntent *)intent withCompletion:(void (^)(INStringResolutionResult * _Nonnull))completion
{
    if (intent.content) {
        NSString *content = [NSString stringWithFormat:@"Dictated text: \(%@)",intent.content];
        INStringResolutionResult *resolutionResult = [INStringResolutionResult successWithResolvedString:content];
        completion(resolutionResult);
    }
    else
    {
        INStringResolutionResult *resolutionResult = [INStringResolutionResult needsValue];
        completion(resolutionResult);
    }
}

@end
