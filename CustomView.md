# <a name="xib"></a>Custom View With xib (IOS 7 &amp; 8)

中文版：[IOS Custom View Part 1](http://yume190.github.io/2014/09/26/IOS-Custom-View-Part-1/)

Related Documents

 * [CustomView.h](CustomViewTest/TemplateView1.h)
 * [CustomView.m](CustomViewTest/TemplateView1.m)
 * [CustomView.xib](CustomViewTest/TemplateView1.xib)

### Step 1
 * Create a CustomView class inherit from UIView.(ex:CustomView.h & CustomView.m)
 * Then create xib file with same name.(ex:CustomView.xib)

### Step 2
 * Click the xib file
 * Find the File's Owner and click it
 * command + option + 3
 * Input your Custom Class name.(ex:CustomView)

### Step 3
 * Implement `initWithCoder` method 

<pre><code>- (void) setup{
    NSString *nibName = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    //Add the view loaded from the nib into self.
    [self addSubview:self.view];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self setup];
    }
    return self;
}
</code></pre>

### Step 4 (Optional)
 * If you want to input your parameter at storyboard.
 * Drag a UIView to your storyboard.
 * Click it -> command + option + 3 -> input your Custom Class name
 * Find the "User denfined Runtime Attributes"
 * enter the parameter you want

ex: String vTitle = "the title"

| Key Path      | Type          | Value   |
| :------------ |:--------------|:--------|
|vTitle         |String         |the title|

 * Create a property in CustomView.h

<pre><code>@property (assign) NSString* vTitle;</code></pre>

 * Implement `awakeFromNib` in CustomView.m

<pre><code>- (void)awakeFromNib {
    labelTitle.text = vTitle;
}</code></pre>
