//
//  ViewController.m
//  ParseDemoApp
//
//  Created by fdadzie20 on 7/6/20.
//  Copyright © 2020 fdadzie20. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
}

- (IBAction)onSignUp:(id)sender {
    
    NSString *username = self.userTextField.text;
    NSString *password = self.passTextField.text;
        
      UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Username/Password Error"
                message:@"Username or Password is empty"
                preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // handle response here.
        }];
        
        [alert addAction:okAction];
        
        if ([self.userTextField.text isEqual:@""]||[self.passTextField.text isEqual:@""])
        {
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
            }];
        }
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        
        user.username = self.userTextField.text;
        user.password = self.passTextField.text;
        
            if (error != nil) {
                
                
                NSLog(@"User log in failed: %@", error.localizedDescription);
            } else {
                NSLog(@"User logged in successfully");
                [self performSegueWithIdentifier:@"firstSegue" sender:nil];
                
                // display view controller that needs to shown after successful login
            }
        }];
}

- (IBAction)onLogin:(id)sender {
    
    // caches user to [PFUSer current] after sign-in
    // calls to PFUser.current() will use the latest logged in user
    NSString *username = self.userTextField.text;
    NSString *password = self.passTextField.text;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Username/Password Error"
            message:@"Username or Password is empty"
            preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // handle response here.
    }];
    
    [alert addAction:okAction];
    
    if ([self.userTextField.text isEqual:@""]||[self.passTextField.text isEqual:@""]){
    [self presentViewController:alert animated:YES completion:^{
        // optional code for what happens after the alert controller has finished presenting
    }];
}
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            [self performSegueWithIdentifier:@"firstSegue" sender:nil];
            
            // display view controller that needs to shown after successful login
        }
    }];
}



@end
