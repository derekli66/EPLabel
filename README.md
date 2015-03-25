#EPLabel
-------
EPLabel is a simple UILabel subclass to support multi-line text. If you need more properties like line height or hyperlink detection, please consider TTTAttributedLabel or using NSAttributedString with pure UILabel.

How to use
-----------
In your view controller or any UIView subclass,

```objective-c

NSString *text = <#A_Long_Text#>;
EPLabel *newLabel = [[EPLabel alloc] initWithFrame:CGRectMake(10, 10, 200, 200)];
newLabel.textColor = [UIColor redColor];
newLabel.text = text;
newLabel.font = self.myLabel.font;
[newLabel bestSize]; // Before getting the best size, text and font property must be set priorly.
    
self.myLabel = newLabel;
[self.view addSubview:self.myLabel]; 

```
Note: Be aware that Autolayout will affect label resizing when run -bestSize method

Demo Result
-------
