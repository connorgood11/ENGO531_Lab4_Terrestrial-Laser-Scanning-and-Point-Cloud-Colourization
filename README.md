# ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization

# Introduction

For this lab, we performed a laser scan of our object from the previous lab using a Faro scanner. The object was the same object in Lab 3, being a set of lockers in the ENF 325 room. The scan was done not measuring RGB values, which would then be added during the lab using an image taken of the object. A bundle adjustment was done to convert the object points in the images to the coordinate space of the laser scanner. From there, the non-colourized point cloud could be assigned RGB values with a MATLAB script and selected images taken during Lab 3. Then, a colourized point cloud of our object is created.

# TLS Data Capture

Laser scanning of the object was done in the room ENF 325. It was set up in the exact way as shown below in figure 1. The object is just out of view to the left of the image

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/d21dcaaf-5f65-4761-89f9-cbc84576c35e)


_Figure 1: Image of laser scanner set up_

A plot was created of the area. The origin was changed to be the location of the laser scanner, and the coordinates of the object points and camera points were converted to this new system.

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/101d8907-3bc6-4c4f-8c6d-71edc1d66020)


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

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/a0b5f9c0-5fc3-4c11-a06f-eb585b53e10f)


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

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/af61c01a-08d8-4768-8735-c326998e2e3a)


_Figure 4: Collinearity equations for back projection_

A MATLAB function was created to use a for loop to iterate through each point cloud point and use the back projection function. It then searched the corresponding image from the used EOPs for the RGB values at the received pixel coordinates from the back projection function. The point cloud points that did not fall on the image were left as white. The RGB values were continually appended together and returned by the function to then be appended to the point cloud dataset columns. The program works based on the image number, so the code can be run to retrieve the RGB values for the point cloud data on any image required.

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/65432a13-6561-45dc-ba37-84655b2bf2ac)


_Figure 5: Points with their xyz coordinates and RGB values_

# Colourized Point Cloud Analysis

To begin the analysis, the group added in the trimmed point cloud that was used for colourization. The area of interest is a group of eight lockers on the left of the wooden divider, the group kept the other parts in for analysis and to show how the group checked to see if the points were in each image.

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/4a14a3d1-c775-4ef3-8d19-33df22f358e9)

_Figure 6: Trimmed point cloud used for colourization_

In this point cloud image, you can see there are some areas that do not have points including the handles of each locker which is a reflective silver metal. The reflectiveness of the metal is why there was no return for the laser on those points as the intensity was too great for the scanner to recognize that there was a point there and did not register those laser returns.

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/dc84fd7c-09d0-4db8-aa40-dc7ad39fc97d)


_Figure 7: Lack of point returns on metal surfaces_

There were also some 'noise' points still left in the groups point cloud after cleaning it up but due to the time it would have taken to remove every noise point the group determined it was not worth removing all these points. Noise points are deviations from the normal for an area, for example in the image below there are points in between the floor and the bottom of the lockers which in reality we know there is nothing there.

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/3d39631e-19ba-4422-b701-705ffc641c75)


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

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/64e69a26-f80f-4927-adf6-4274b6bd248c)

_Figure 9: Image 3 taken during Lab 3_

Using image three to colourize our point cloud, the group got the resulting point cloud with RBG values as shown below in figure 10.

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/856d08eb-fa8e-49f1-8c4c-04153f85f136)


_Figure 10: Colourized point cloud using image 3_

In the image above you can see the left side of the point cloud looks correct but as you move farther right the colour seems to get increasingly inaccurate. This is because in image 3 shown previously in figure 9, the lockers are not perfectly level due to the image's orientation. The resulting error can clearly be seen in the dark line the defines the vertical portion of the locker and how it starts to veer upwards away from the true position.

To try and mitigate this error the group then switched images to image four, seen in figure 11, to colourize our point cloud which can be seen in figure 12 below

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/d31f147b-9913-4efd-9c7a-a526b5ab0fab)


_Figure 11: Image 4 taken during Lab 3_

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/d0a6a8c8-5812-47f6-8ecf-453f65373504)


_Figure 12: Colourized point cloud using image 4_

To clarify, the group created a function that would check if the 3D points from the point cloud were in the image being used to colourize the point cloud and if they were not, they would be assigned RGB values that would colour them white. This can be shown more clearly in figure 13 below.

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/f23e662e-2a23-47dd-a409-13e8cc6363ad)


_Figure 13: White point cloud points_

The point cloud that was colourized by image four had the same problem as the point cloud colourized by image 3 which shows the vertical line above the lockers veering upward as the lockers move away from where the image was taken. To try and mitigate this error the group then used both image 3 and 4 and averaged the RGB values to colourize our point cloud which can be seen in figure 14 below.

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/8341fd28-487f-4b74-b166-be520fa5941f)


_Figure 14: Colourized point cloud using averages from images 3 and 4_

This method did not work as the group had hoped, for example, the vertical lines on the top of the lockers the group imagined they would move halfway between the two images but since we are dealing with RGB values they did not adjust much and mostly showed two values where there was a discrepancy between the two images. This 'double lines' can be shown clearly in the writing on the one locker in figures 15 below.

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/f5d4a985-df05-4bf5-a6ac-1aed813224c9)![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/97cbdd05-a649-4a42-a854-84ef55e6ed21)![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/822223a0-5c9b-4c7c-a4a9-ef16ef3f1b1c)

_Figure 15: Comparison between image 3 (left), image 4 (right), average of both (middle)_

As you can see with image 3 on the left, the average in the middle, and image 4 on the right, instead of moving the lines halfway they are simplly shown as two lines.

Now to mitigate this new error the group decided to split the point cloud into two different sections and clourized them using the images closest. The group split the lockers down the middle and used the four lockers on the left to be colourized by image 3 and the four lockers on the right to be colourized by image 4. The resulting poont cloud can be found in figure 16 below.

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/366a759b-3cd9-4686-b963-bf764d621079)


_Figure 16: Final colourized point cloud using the left side of image 3 and right side of image 4_

In this point cloud the group ends up with the vertical lines on each side very close to their true location and there are no double lines on any of the writing due to the average error mentioned before. This colourization method worked out very well for the yellow group and can be shown below how accurate the colour is to the actual images.

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/f5402265-6520-46ee-b12c-6e361c366450)![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/aef2e4f0-f1f4-4f64-b208-5c54723a2657)

_Figure 17: Comparison of sticker on lockers between colourized point cloud and image_

![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/da3a530f-d4ec-4f81-8a1e-c47c076f8469)![image](https://github.com/connorgood11/ENGO531_Lab4_Terrestrial-Laser-Scanning-and-Point-Cloud-Colourization/assets/77460425/4bd1d74e-51c1-4d18-a954-215a8e6268ee)


_Figure 18: Comparison of writing on lockers between colourized point cloud and image_

There were no glaring areas that were obviously coloured wrong when using the last method to colourize the point cloud so the group decided this final colourization met our standards.
