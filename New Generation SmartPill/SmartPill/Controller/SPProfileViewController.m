//
//  SPProfileViewController.m
//  SmartPill
//
//  Created by Dennis da Silva Nunes on 27/11/14.
//  Copyright (c) 2014 IFRN - Mobile School. All rights reserved.
//

#import "SPProfileViewController.h"

@interface SPProfileViewController ()

@end

@implementation SPProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateViewConstraints];
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    self.userName.text = [self userNameString];
    self.userEmail.text = [self userEmailString];
    self.connectedWith.text = [self connectedWithString];
}

- (NSString*)userNameString{
    SPAppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    if (delegate.currentUser.name) {
        return delegate.currentUser.name;
    }
    return nil;
}

- (NSString*)userIdNumber{
    SPAppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    if (delegate.currentUser.userFacebookId) {
        return delegate.currentUser.userFacebookId;
    }
    if (delegate.currentUser.userGoogleId) {
        return delegate.currentUser.userGoogleId;
    }
    if (delegate.currentUser) {
        return [delegate.currentUser.userId stringValue];
    }
    return nil;
}

- (NSString*)userEmailString{
    SPAppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    if (delegate.currentUser.email) {
        return delegate.currentUser.email;
    }
        return nil;
}

- (NSString*)connectedWithString{
    SPAppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    if (delegate.currentUser.userFacebookId) {
        return @"Facebook";
    }
    if (delegate.currentUser.userGoogleId) {
        return @"Google";
    }
    if (delegate.currentUser) {
        return @"SmartPill";
    }
    return nil;
}

- (void)resetUserLabelData{
    SPAppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    delegate.currentUser = nil;
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    //Checks
    if (buttonIndex == 1) {
        //Retirar do banco
        UIApplication *app = [UIApplication sharedApplication];
        [app cancelAllLocalNotifications];
        SPAppDelegate * delegate = [[UIApplication sharedApplication] delegate];
        SPTabBarViewController * tabBarVC = (SPTabBarViewController*)self.tabBarController;
        [SPUserHandler deleteUser:delegate.currentUser fromDataBase:delegate.managedObjectContext];
        [self resetUserLabelData];
        [tabBarVC.navigationController popToRootViewControllerAnimated:YES];
    }
}


- (IBAction)removeAccountAction:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Desvincular conta" message:@"Deseja excluir permanentemente esta conta?" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Excluir", nil];
    [alert show];
    [self alertView:alert clickedButtonAtIndex:0];
}

@end
