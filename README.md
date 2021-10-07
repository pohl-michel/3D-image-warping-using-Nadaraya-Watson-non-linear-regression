This program deforms an original 3D image according to a certain deformation vector field (DVF).
The deformation method is based on Nadaraya-Watson regression.

The left image below corresponds to the coronal cross-section of a 3D region of interest containing a lung tumor. The motion vectors representing the projection of a 3D motion field corresponding to breathing onto that cross-section are superimposed on the left image. That 3D motion field is defined at each voxel of the initial image. The output of the code is the warped 3D image, whose sagittal cross-section is displayed on the right.

<p float="left">
<img src="DVF Ycs=71.jpg" width="40%" height="40%"/>
<img src="Warped image y slice y = 71 gaussian kernel filter_size 3 sg_warp 0.500000.jpg" width="40%" height="40%"/>
</p>
 
We used this code (including the hyper-parameter optimization, cf below) in the following research article: Michel Pohl, Mitsuru Uesaka, Kazuyuki Demachi, Ritu Bhusal Chhatkuli,
Prediction of the motion of chest internal points using a recurrent neural network trained with real-time recurrent learning for latency compensation in lung cancer radiotherapy,
Computerized Medical Imaging and Graphics,
Volume 91,
2021,
101941,
ISSN 0895-6111,
https://doi.org/10.1016/j.compmedimag.2021.101941.
Please consider citing that article if you use this code in your research.

This program can : 
 - save cross sections and slices of the original images and the warped image
 - save the 3D warped image. 
 - save the projection of the DVF along a y plane (for visualization). 

The main function to execute is "Nadaraya_Watson_warping_main.m".

The behavior of the program is controlled by the structure beh_par defined in "load_behavior_parameters3D()",
and this structure's fields can be changed manually.
The parameters for warping the initial image can be set manually inside the function "load_3Dwarp_par()".
The parameters concerning the display and the initial image are respectively contained inside the excel files "3Ddisp_par.xlsx" and "3Dim_seq_par.xlsx"

An input image example, named "original_image.dcm", as well as a deformation vector field, named "DVF_for_warping.mat" are provided.
They represent the tumor of a patient with lung cancer and the motion of that tumor due to breathing.
The image was acquired by a 16-slice helical CT simulator (Brilliance Big Bore, Philips Medical System)
in Virginia Commonwealth University Massey Cancer Center,
which comes from the Cancer Imaging Archive open database.
The DVF is noisy along the edges of the initial image, because it has been computed automatically using the optical flow algorithm, which may have trouble on such areas.

More details about that database can be found in :
 - Hugo, Geoffrey D., Weiss, Elisabeth, Sleeman, William C., Balik, Salim, Keall, Paul J., Lu, Jun, & Williamson, Jeffrey F. (2016). Data from 4D Lung Imaging of NSCLC Patients. The Cancer Imaging Archive. http://doi.org/10.7937/K9/TCIA.2016.ELN8YGLE
 - Hugo, G. D., Weiss, E., Sleeman, W. C., Balik, S., Keall, P. J., Lu, J. and Williamson, J. F. (2017), A longitudinal four-dimensional computed tomography and cone beam computed tomography dataset for image-guided radiation therapy research in lung cancer. Med. Phys., 44: 762–771. doi:10.1002/mp.12059
 - S. Balik et al., “Evaluation of 4-Dimensional Computed Tomography to 4-Dimensional Cone-Beam Computed Tomography Deformable Image Registration for Lung Cancer Adaptive Radiation Therapy.” Int. J. Radiat. Oncol. Biol. Phys. 86, 372–9 (2013) PMCID: PMC3647023.
 - N.O. Roman, W. Shepherd, N. Mukhopadhyay, G.D. Hugo, and E. Weiss, “Interfractional Positional Variability of Fiducial Markers and Primary Tumors in Locally Advanced Non-Small-Cell Lung Cancer during Audiovisual Biofeedback Radiotherapy.” Int. J. Radiat. Oncol. Biol. Phys. 83, 1566–72 (2012). DOI:10.1016/j.ijrobp.2011.10.051
 - Clark K, Vendt B, Smith K, Freymann J, Kirby J, Koppel P, Moore S, Phillips S, Maffitt D, Pringle M, Tarbox L, Prior F. The Cancer Imaging Archive (TCIA): Maintaining and Operating a Public Information Repository, Journal of Digital Imaging, Volume 26, Number 6, December, 2013, pp 1045-1057. DOI: 10.1007/s10278-013-9622-7
