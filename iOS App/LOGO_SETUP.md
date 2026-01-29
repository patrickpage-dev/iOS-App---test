# Logo and App Icon Setup Guide

This guide will help you add the Conquest Solutions logo and app icon to the iOS app.

## Adding the Logo Image

1. **Prepare the Logo Image:**
   - Use the Conquest Solutions logo PNG file (the CS monogram logo)
   - Recommended size: 200x200 points (400x400 pixels for @2x, 600x600 pixels for @3x)
   - Format: PNG with transparency
   - Name: `ConquestSolutionsLogo.png`

2. **Add Logo to Xcode Project:**
   - In Xcode, right-click on the `ConquestSolutionsApp` folder in the Project Navigator
   - Select **Add Files to "ConquestSolutionsApp"...**
   - Navigate to your logo PNG file
   - Make sure **"Copy items if needed"** is checked
   - Make sure your app target is selected
   - Click **Add**

3. **Alternative: Add to Assets Catalog:**
   - Open `Assets.xcassets` in Xcode
   - Right-click in the left sidebar and select **New Image Set**
   - Name it `ConquestSolutionsLogo`
   - Drag your logo images:
     - 1x: 200x200 pixels
     - 2x: 400x400 pixels  
     - 3x: 600x600 pixels
   - The code will automatically use this asset

4. **Verify:**
   - The logo should now appear in the Sign In screen
   - If the image doesn't appear, check that the filename matches `Constants.logoImageName` ("ConquestSolutionsLogo")

## Adding the App Icon

1. **Prepare App Icon Images:**
   - You'll need multiple sizes for the app icon
   - Create icons in these sizes:
     - 20x20 (@2x: 40x40, @3x: 60x60) - Notification
     - 29x29 (@2x: 58x58, @3x: 87x87) - Settings
     - 40x40 (@2x: 80x80, @3x: 120x120) - Spotlight
     - 60x60 (@2x: 120x120, @3x: 180x180) - App Icon
     - 1024x1024 - App Store

2. **Add to Assets Catalog:**
   - In Xcode, open `Assets.xcassets`
   - Click on **AppIcon** (or create it if it doesn't exist)
   - Drag your icon images into the appropriate slots
   - Xcode will show which sizes are required

3. **Quick Method - Single Icon:**
   - If you have one 1024x1024 icon, you can use an online tool like [AppIcon.co](https://www.appicon.co) to generate all required sizes
   - Or use Xcode's built-in generator (right-click on AppIcon → New iOS App Icon)

## Logo Specifications

Based on the Conquest Solutions brand:
- **Colors**: Black and Red (#DC2626)
- **Style**: CS monogram interlocking design
- **Background**: Transparent or white
- **Usage**: Use on light backgrounds for best visibility

## Troubleshooting

### Logo Not Appearing
- Check that the image file is added to the project (not just in the folder)
- Verify the filename matches exactly: `ConquestSolutionsLogo`
- Check that the image is included in your app target (select image in Project Navigator, check Target Membership in File Inspector)
- Try cleaning the build folder (Product > Clean Build Folder) and rebuilding

### App Icon Not Showing
- Ensure all required icon sizes are provided
- Check that AppIcon is set in the project's General settings
- Verify the icons are in the Assets catalog, not just in the project folder

## Notes

- The app will fall back to a system icon if the logo image is not found
- For best results, use vector-based images or high-resolution PNGs
- Consider creating @2x and @3x versions for Retina displays
