/// @description Fade to black


x = 0;
y = 0;
if (image_alpha != target_image_alpha) { 
    /// Approach the target image alpha
    image_alpha = approach(image_alpha, target_image_alpha, duration);
} else {
    if (image_alpha == 0) {
        //Go to next room because it's completly black
        target_image_alpha = 0;
            //Destroy the transition object
            instance_destroy();
            }
}



