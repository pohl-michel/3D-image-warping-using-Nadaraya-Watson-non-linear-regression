This repository is the third of a series of three repositories containing code that we used in the research corresponding to the following article:

Michel Pohl, Mitsuru Uesaka, Kazuyuki Demachi, Ritu Bhusal Chhatkuli, "Prediction of the motion of chest internal points using a recurrent neural network trained with real-time recurrent learning for latency compensation in lung cancer radiotherapy", Computerized Medical Imaging and Graphics, Volume 91, 2021, 101941, ISSN 0895-6111

You can access it with the following links:

 - https://doi.org/10.1016/j.compmedimag.2021.101941 (journal version with restricted access)
 - https://doi.org/10.48550/arXiv.2207.05951 (accepted manuscript version, open access)

The code in this repository deforms an original 3D image according to a certain deformation vector field (DVF), using Nadaraya-Watson regression. The two other repositories corresponding to the article mentioned above are the following:

 - Lucas-Kanade pyramidal optical flow for 3D image sequences: https://github.com/pohl-michel/Lucas-Kanade-pyramidal-optical-flow-for-3D-image-sequences
 - time series prediction with an RNN trained with RTRL: https://github.com/pohl-michel/Time-series-prediction-with-an-RNN-trained-with-RTRL

Please kindly consider citing our published article if you use this code in your research. Also, please do not hesitate to look at the other two repositories mentioned above.


The left image below corresponds to the coronal cross-section of a 3D region of interest containing a lung tumor. The motion vectors representing the projection of a 3D motion field corresponding to breathing onto that cross-section are superimposed on the left image. That 3D motion field is defined at each voxel of the initial image. The output of the code is the warped 3D image, whose sagittal cross-section is displayed on the right.

<p float="left">
<img src="DVF Ycs=71.jpg" width="40%" height="40%"/>
<img src="Warped image y slice y = 71 gaussian kernel filter_size 3 sg_warp 0.500000.jpg" width="40%" height="40%"/>
</p>
 
This program can : 
 - save cross sections and slices of the original images and the warped image
 - save the 3D warped image. 
 - save the projection of the DVF along a y plane (for visualization). 

The main script to execute is "Nadaraya_Watson_warping_main.m".

The behavior of the program is controlled by the `beh_par` structure, defined in `load_behavior_parameters3D()` and whose fields can be changed manually.
The parameters for warping the initial image can be set manually inside the `load_3Dwarp_par()` function.
The parameters concerning the display and the initial image are respectively contained inside the excel files "3Ddisp_par.xlsx" and "3Dim_seq_par.xlsx"

An input image example, named "original_image.dcm", as well as a deformation vector field, named "DVF_for_warping.mat" are provided.
They represent the tumor of a patient with lung cancer and the motion of that tumor due to breathing.
The image was acquired by a 16-slice helical CT simulator (Brilliance Big Bore, Philips Medical System)
in Virginia Commonwealth University Massey Cancer Center,
which comes from the 4D-Lung dataset of the Cancer Imaging Archive open database: https://wiki.cancerimagingarchive.net/display/Public/4D-Lung

The DVF is noisy along the edges of the initial image, as those areas respresent a challenge for optical flow methods.

-----------------------------------------------

Update (10th October 2024): An adaptation of the code in this repository for 2D image warping (instead of 3D) is available here: https://github.com/pohl-michel/2D-MR-image-prediction. That new repository focuses mainly on video forecasting but warping is implemented to transform the first image of the input sequence using the predicted deformation field into the predicted image in the future.
