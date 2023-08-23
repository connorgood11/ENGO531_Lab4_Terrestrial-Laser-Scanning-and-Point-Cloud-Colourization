# ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization

# Introduction

For this lab, we performed a laser scan of our object from the previous lab using a Faro scanner. The object was the same object in Lab 3, being a set of lockers in the ENF 325 room. The scan was done not measuring RGB values, which would then be added during the lab using an image taken of the object. A bundle adjustment was done to convert the object points in the images to the coordinate space of the laser scanner. From there, the non-colourized point cloud could be assigned RGB values with a MATLAB script and selected images taken during Lab 3. Then, a colourized point cloud of our object is created.

# TLS Data Capture

Laser scanning of the object was done in the room ENF 325. It was set up in the exact way as shown below in figure 1. The object is just out of view to the left of the image

![](RackMultipart20230823-1-fhl511_html_3845352238d10509.jpg)

_Figure 1: Image of laser scanner set up_

A plot was created of the area. The origin was changed to be the location of the laser scanner, and the coordinates of the object points and camera points were converted to this new system.

![](RackMultipart20230823-1-fhl511_html_45c5a65b7bc533c9.jpg)

_Figure 2: Plot of object points, picture points and laser scanner origin_

The scan was run successfully with the following settings shown in Table 1.

_Table 1: Settings of Laser Scan_

| **Parameter** | **Value** |
| --- | --- |
| Scan with Color | No |
| Eye Safety Distance (m) | 7.50 (axial)2.8 (radial) |
| Scan Duration (mm:ss) (approximate) | 04:34 |
| Scan File Size (MB) (approximate) | 136.38 |
| Scan Size (points) | 10310 x 4268 |
| MPts | 43.7 |
| Point Distance (mm/ 10m) | 6.136 |
| Resolution | 1/4 |
| Quality | 3x |

# Geometric Network

For our zero-order design constraints, we made sure to have a minimally constrained datum. Our coordinate system changed origin and orientation but remained consistent in scale, since distances did not change in 3-dimensional space. From the collected laser scans, we were able to confidently pick out and use 13 out of the 18 points used as object points in Lab 3. Object points 1, 2, 3, 13, 16 were not used for this lab. Since the object points picked from the images were set as control for the network, points picked from the laser scanning were used as observation. This eliminated the rest of the datum defects. The group did not use any inner constraints.

For first order design measures, the laser scanning fulfilled most of these requirements since it covers the object very consistently. However, it could be improved by doing another two scans from different angles to the object to eliminate any bias that there may be from one set up location.

It could be said that the network is vastly improved when compared to networks of other labs, simply due to the laser scanner, and its capabilities. It delivers a much more reliable form of photogrammetric observations, and eliminates many datum defects, thus producing a much more reliable network.

# Obtaining RGB Values

A bundle adjustment was run with approximate EOPs to receive the adjusted EOPs for the images in the object space coordinates (Point clouds coordinate system) using the adjusted IOPs from lab 2 and the images in lab 3.

_Table 2: Summary of Bundle Adjustment_

| The number of Cameras used | 1 |
| --- | --- |
| Numbers of the Cameras used | 99 |
| The number of points | 13 |
| The number of control points | 13 |
| The number of tie points | 0 |
| Number of observations | 157 |
| Number of unknowns | 75 |
| Degrees of freedom | 82 |
| Iterations ran | 7 |
| Estimated Variance Factor (mm) | 93.617 |
| Fit of observations to model (mm) (RMS) | 7.3014 |

Based on the estimated variance factor and fit of the observations to the model, they were not significant in magnitude, but still large enough where some improvement could be made to the model to reduce them.

_Table 3: IOP values used from Lab 2 Camera Calibration_

| Camera | X\_p (mm) | Y\_p (mm) | C (mm) |
| --- | --- | --- | --- |
| 99 | 1509.5 | 2009.0 | 3064.0 |

_Table 4: Initial Estimated EOP Values_

| Image | Camera | X (mm) | Y (mm) | Z (mm) | W (°) | P (°) | K (°) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 99 | 1.538 | -2.068 | 1091.863 | 90.000 | 100.000 | 0.000 |
| 2 | 99 | 1.090 | -1.498 | 1091.864 | 90.000 | 110.000 | 0.000 |
| 3 | 99 | 1.090 | -0.806 | 1091.871 | 90.000 | 120.000 | 0.000 |
| 4 | 99 | -1.208 | -0.791 | 1091.869 | 90.000 | -120.000 | 0.000 |
| 5 | 99 | -1.203 | -1.255 | 1091.864 | 90.000 | -110.000 | 0.000 |
| 6 | 99 | -1.667 | -1.706 | 1091.866 | 90.000 | -100.000 | 0.000 |

_Table 5: Adjusted EOP values_

| Image | Camera | X (mm) | Y (mm) | Z (mm) | W (°) | P (°) | K (°) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 99 | 1.500 | -2.042 | 1092.574 | 99.540 | 122.298 | -7.995 |
| 2 | 99 | 1.019 | -1.530 | 1092.516 | 93.468 | 149.255 | -2.911 |
| 3 | 99 | 1.039 | -0.886 | 1092.480 | 93.934 | 152.219 | -1.600 |
| 4 | 99 | -1.160 | -0.864 | 1092.471 | 93.224 | -156.206 | 1.156 |
| 5 | 99 | -1.173 | -1.285 | 1092.464 | 94.534 | -151.426 | 1.976 |
| 6 | 99 | -1.601 | -1.760 | 1092.475 | 92.090 | -133.463 | 1.736 |

_Table 6: Control point values_

| Point | X (mm) | Y (mm) | Z (mm) |
| --- | --- | --- | --- |
| 4 | -0.862 | -3.008 | 1092.562 |
| 5 | 0.855 | -3.012 | 1091.955 |
| 6 | -1.037 | -2.994 | 1091.953 |
| 7 | 0.862 | -3.000 | 1092.902 |
| 8 | -1.053 | -2.991 | 1092.940 |
| 9 | 0.771 | -3.020 | 1092.844 |
| 10 | -0.989 | -3.009 | 1092.848 |
| 11 | -0.527 | -3.011 | 1092.428 |
| 12 | 0.312 | -3.016 | 1092.426 |
| 14 | -0.090 | -3.020 | 1092.004 |
| 15 | -0.706 | -3.007 | 1092.833 |
| 17 | -0.598 | -3.0118 | 1092.012 |
| 18 | 0.813 | -3.009 | 1092.188 |

![](RackMultipart20230823-1-fhl511_html_1a9970e7e701807a.png)

_Figure 3: Plot showing the standardized residual within expected threshold_

_Table 7: Standard deviations of the EOPs_

| Image | Camera | X (mm) | Y (mm) | Z (mm) | W (rad) | P (rad) | K (rad) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 99 | 0.710 | 0.758 | 0.943 | 0.912 | 0.366 | 0.614 |
| 2 | 99 | 0.724 | 0.713 | 1.191 | 0.765 | 0.367 | 0.381 |
| 3 | 99 | 0.918 | 0.871 | 1.637 | 0.758 | 0.367 | 0.370 |
| 4 | 99 | 0.895 | 0.836 | 1.630 | 0.747 | 0.367 | 0.357 |
| 5 | 99 | 0.765 | 0.727 | 1.334 | 0.753 | 0.367 | 0.373 |
| 6 | 99 | 0.711 | 0.719 | 1.063 | 0.808 | 0.367 | 0.475 |

Standard deviations of the EOPs were fairly low and within an acceptable threshold.

_Table 8: Correlation Matrix for EOPs for image 3_

|
 | X | Y | Z | W | P | K | Xp | Yp | C |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| X | 1.000 | 0.994 | -0.103 | -0.932 | 0.114 | -0.347 | -0.214 | -0.177 | -0.777 |
| Y | 0.994 | 1.000 | -0.176 | -0.938 | 0.174 | -0.407 | -0.170 | -0.114 | -0.804 |
| Z | -0.104 | -0.176 | 1.000 | 0.177 | -0.888 | 0.730 | -0.290 | -0.820 | 0.023 |
| W | -0.932 | -0.938 | 0.177 | 1.000 | -0.242 | 0.320 | 0.195 | -0.026 | 0.896 |
| P | 0.114 | 0.174 | -0.888 | -0.242 | 1.000 | -0.398 | -0.034 | 0.817 | -0.097 |
| K | -0.347 | -0.407 | 0.730 | 0.320 | -0.398 | 1.000 | -0.672 | -0.335 | 0.202 |
| Xp | -0.214 | -0.170 | -0.290 | 0.195 | -0.034 | -0.672 | 1.000 | 0.073 | 0.117 |
| Yp | -0.177 | -0.114 | -0.820 | -0.0269 | 0.817 | -0.335 | 0.073 | 1.000 | 0.035 |
| C | -0.777 | -0.804 | 0.023 | 0.896 | -0.097 | 0.202 | 0.117 | 0.035 | 1.000 |

_Table 9: Correlation matrix for EOPS for image 4_

|
 | X | Y | Z | W | P | K | Xp | Yp | C |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| X | 1.000 | -0.205 | -0.891 | 0.175 | -0.439 | 0.989 | -0.140 | -0.192 | -0.685 |
| Y | -0.205 | 1.000 | 0.224 | -0.887 | 0.733 | -0.157 | -0.283 | -0.782 | 0.037 |
| Z | -0.891 | 0.224 | 1.000 | -0.275 | 0.346 | -0.824 | 0.164 | -0.021 | 0.883 |
| W | 0.175 | -0.887 | -0.275 | 1.000 | -0.398 | 0.112 | -0.038 | 0.792 | -0.107 |
| P | -0.439 | 0.733 | 0.346 | -0.398 | 1.000 | -0.420 | -0.668 | -0.286 | 0.190 |
| K | 0.989 | -0.157 | -0.824 | 0.112 | -0.420 | 1.000 | -0.149 | -0.273 | -0.588 |
| Xp | -0.140 | -0.283 | 0.164 | -0.038 | -0.668 | -0.149 | 1.000 | 0.069 | 0.089 |
| Yp | -0.192 | -0.782 | -0.021 | 0.792 | -0.286 | -0.273 | 0.069 | 1.000 | 0.014 |
| C | -0.685 | 0.037 | 0.883 | -0.107 | 0.190 | -0.588 | 0.089 | 0.0148 | 1.000 |

Some values were still highly correlated (values of 0.80 or higher), so it could be said that some improvement to the network could be made.

Implemented a MATLAB function to perform a back projection to receive pixel coordinates from the 833,893 point cloud coordinates and adjusted EOPs and IOPs, leaving the system as a left-handed coordinate system and using K = -1.

![](RackMultipart20230823-1-fhl511_html_51647abd829a6ef.png)

_Figure 4: Collinearity equations for back projection_

A MATLAB function was created to use a for loop to iterate through each point cloud point and use the back projection function. It then searched the corresponding image from the used EOPs for the RGB values at the received pixel coordinates from the back projection function. The point cloud points that did not fall on the image were left as white. The RGB values were continually appended together and returned by the function to then be appended to the point cloud dataset columns. The program works based on the image number, so the code can be run to retrieve the RGB values for the point cloud data on any image required.

![](RackMultipart20230823-1-fhl511_html_38f0841046ee8cd9.png)

_Figure 5: Points with their xyz coordinates and RGB values_

# Colourized Point Cloud Analysis

To begin the analysis, the group added in the trimmed point cloud that was used for colourization. The area of interest is a group of eight lockers on the left of the wooden divider, the group kept the other parts in for analysis and to show how the group checked to see if the points were in each image.

![](RackMultipart20230823-1-fhl511_html_16f9a9a45de714a5.png)

_Figure 6: Trimmed point cloud used for colourization_

In this point cloud image, you can see there are some areas that do not have points including the handles of each locker which is a reflective silver metal. The reflectiveness of the metal is why there was no return for the laser on those points as the intensity was too great for the scanner to recognize that there was a point there and did not register those laser returns.

![](RackMultipart20230823-1-fhl511_html_6bdae0d2e30351.png)

_Figure 7: Lack of point returns on metal surfaces_

There were also some 'noise' points still left in the groups point cloud after cleaning it up but due to the time it would have taken to remove every noise point the group determined it was not worth removing all these points. Noise points are deviations from the normal for an area, for example in the image below there are points in between the floor and the bottom of the lockers which in reality we know there is nothing there.

![](RackMultipart20230823-1-fhl511_html_77038356fc40f730.png)

_Figure 8: Noise points in point cloud_

To begin the analysis, the group had to decide which image to use to begin the colorization, so the group found the closest image to the scanner origin and chose that image for colorization. All the distance can be found in the Table below.

_Table 10: Distances of image point to the origin_

| EOP to Origin | Distance in x & y (m) |
| --- | --- |
| EOP 1 | 2.577529121 |
| EOP 2 | 1.852713792 |
| EOP 3 | 1.355937025 |
| EOP 4 | 1.443621077 |
| EOP 5 | 1.738692531 |
| EOP 6 | 2.385495545 |

In order to obtain RGB values for our point cloud, we used Image 3 from our Lab 3, shown below in figure 9

![](RackMultipart20230823-1-fhl511_html_ac702ec0e046ce8.jpg)

_Figure 9: Image 3 taken during Lab 3_

Using image three to colourize our point cloud, the group got the resulting point cloud with RBG values as shown below in figure 10.

![](RackMultipart20230823-1-fhl511_html_94e2b873b02305f6.png)

_Figure 10: Colourized point cloud using image 3_

In the image above you can see the left side of the point cloud looks correct but as you move farther right the colour seems to get increasingly inaccurate. This is because in image 3 shown previously in figure 9, the lockers are not perfectly level due to the image's orientation. The resulting error can clearly be seen in the dark line the defines the vertical portion of the locker and how it starts to veer upwards away from the true position.

To try and mitigate this error the group then switched images to image four, seen in figure 11, to colourize our point cloud which can be seen in figure 12 below

![](RackMultipart20230823-1-fhl511_html_38ee92db2ea8d38c.jpg)

_Figure 11: Image 4 taken during Lab 3_

![](RackMultipart20230823-1-fhl511_html_6944e98096aaf935.png)

_Figure 12: Colourized point cloud using image 4_

To clarify, the group created a function that would check if the 3D points from the point cloud were in the image being used to colourize the point cloud and if they were not, they would be assigned RGB values that would colour them white. This can be shown more clearly in figure 13 below.

![](RackMultipart20230823-1-fhl511_html_71b0be0cc0898617.png)

_Figure 13: White point cloud points_

The point cloud that was colourized by image four had the same problem as the point cloud colourized by image 3 which shows the vertical line above the lockers veering upward as the lockers move away from where the image was taken. To try and mitigate this error the group then used both image 3 and 4 and averaged the RGB values to colourize our point cloud which can be seen in figure 14 below.

![](RackMultipart20230823-1-fhl511_html_8b8ff613eaa458c2.png)

_Figure 14: Colourized point cloud using averages from images 3 and 4_

This method did not work as the group had hoped, for example, the vertical lines on the top of the lockers the group imagined they would move halfway between the two images but since we are dealing with RGB values they did not adjust much and mostly showed two values where there was a discrepancy between the two images. This 'double lines' can be shown clearly in the writing on the one locker in figures 15 below.

![](RackMultipart20230823-1-fhl511_html_3c03c5a3f20df09f.png) ![](RackMultipart20230823-1-fhl511_html_edca29fadd258647.png) ![](RackMultipart20230823-1-fhl511_html_f7661a78625f8498.png)

_Figure 15: Comparison between image 3 (left), image 4 (right), average of both (middle)_

As you can see with image 3 on the left, the average in the middle, and image 4 on the right, instead of moving the lines halfway they are simplly shown as two lines.

Now to mitigate this new error the group decided to split the point cloud into two different sections and clourized them using the images closest. The group split the lockers down the middle and used the four lockers on the left to be colourized by image 3 and the four lockers on the right to be colourized by image 4. The resulting poont cloud can be found in figure 16 below.

![](RackMultipart20230823-1-fhl511_html_5ab48803322a8d29.png)

_Figure 16: Final colourized point cloud using the left side of image 3 and right side of image 4_

In this point cloud the group ends up with the vertical lines on each side very close to their true location and there are no double lines on any of the writing due to the average error mentioned before. This colourization method worked out very well for the yellow group and can be shown below how accurate the colour is to the actual images.

![](RackMultipart20230823-1-fhl511_html_6df173476df4413a.png) ![](RackMultipart20230823-1-fhl511_html_8c8f8540be80bb40.png)

_Figure 17: Comparison of sticker on lockers between colourized point cloud and image_

![](RackMultipart20230823-1-fhl511_html_8bbda02f4ba74e8d.png) ![](RackMultipart20230823-1-fhl511_html_6f4b2010353fa676.png)

_Figure 18: Comparison of writing on lockers between colourized point cloud and image_

There were no glaring areas that were obviously coloured wrong when using the last method to colourize the point cloud so the group decided this final colourization met our standards.
