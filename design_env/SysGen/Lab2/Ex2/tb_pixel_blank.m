%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DSVB RT-Lab
% Lab2 Ex2: Example Solution (Automated XSVI-Testbench)
%    XSVI control signals are used to simulate the SysGen model under
%    identical conditions as in HW. 
%    The linear address of the first pixel being blanked in each frame, as 
%    well as the blanking value used for this and all subsequent pixels 
%    can be configured per color channel via this testbench.
%    For simplicity, this example solution uses the same image for every 
%    color channel (reg/green/blue) in each input frame.
%
%    Note:
%    =====
%    Before exporting the SysGen Model for HW integration, make sure
%    the SysGen model has been configured corresponding to the maximum 
%    frame size being used on the FPGA-platform! To do so, set No_Sim = 1
%    in order to avoid excessive simulation runtimes.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all;

%% Parameters for HW Model
% Simulation or HW Generation
No_Sim = 0; % 0 = perform simulation; 1 = configure HW-Model only 
% Linear address of pixel to be blanked in each frame
r_blank_idx = 431; % red  
g_blank_idx = 190; % green  
b_blank_idx = 2; % blue
% pixel value to be used for blanking in each frame
r_blank_val = 10; % red
g_blank_val = 100; % green
b_blank_val = 250; % blue
mdl = 'sg_pixel_blank';   % top-level name of model
mdl_hw = '/sg_pixel_blank/'; % hierarchy to HW part of the model

%% Read in the test image (==> enable one of the lines  below <==)
ImgIn = repmat([50 50 100 100 150 150]',3,24); % use 80,640 for VGA resolution
%ImgIn = imread('ActualImage.bmp');             

%% Calculate image constants
if No_Sim == 0
SizeI = size(ImgIn);
ImgY = SizeI(1); 
ImgX = SizeI(2); 
else % No_Sim
ImgY = 480; % # of rows in VGA resolution on HW-platform
ImgX = 640; % # of cols in VGA resolution on HW-platform
end % No_Sim
Npxl = ImgY * ImgX;

%% Form expected output images  (golden model of required functionality)
% Note that Matlab indexes matrix elements column-wise, while in the 
% HW-implementation pixels are streamed row-wise!
if No_Sim == 0
% red
r_ImgExp = ImgIn'; 
r_ImgExp(r_blank_idx+1:Npxl) = r_blank_val; % +1 because of Matlab indexing
r_ImgExp = r_ImgExp';
% green
g_ImgExp = ImgIn'; 
g_ImgExp(g_blank_idx+1:Npxl) = g_blank_val; % +1 because of Matlab indexing
g_ImgExp = g_ImgExp';
% blue
b_ImgExp = ImgIn'; 
b_ImgExp(b_blank_idx+1:Npxl) = b_blank_val; % +1 because of Matlab indexing
b_ImgExp = b_ImgExp';
end % No_Sim

%% Set XSVI length parameter and construct XSVI-input signals
HFP = 2;   % Horizontal Front Porch        [pixel] (VGA: 16)
HSW = 2;   % Horizontal Sync Pulse Width   [pixel] (VGA: 96)
HBP = 2;   % Horizontal Back Porch         [pixel] (VGA: 48)

VFP = 1;   % Vertical Front Porch          [rows]  (VGA: 10)
VSW = 1;   % Vertical Sync Pulse Width     [rows]  (VGA: 2)
VBP = 1;   % Vertical Back Porch           [rows]  (VGA: 33)

HBH = HFP+HSW+HBP;           % hblanc high        [pixel]  (VGA: 160)
VBH = VFP+VSW+VBP;           % vblank high        [rows]   (VGA: 45)
TFL = (HBH+ImgX)*(ImgY+VBH); % total frame length [pixel] 

% form XSVI signals
if No_Sim == 0
    
vsync_i = [ones(1,HSW+HBP+ImgX+HFP) repmat(ones(1,ImgX+HBH),1,ImgY+VFP-1) ...
           repmat(zeros(1,ImgX+HBH),1,VSW)  ...
           repmat(ones(1,ImgX+HBH),1,VBP)];
vblank_i = [zeros(1,HSW+HBP+ImgX+HFP) repmat(zeros(1,ImgX+HBH),1,ImgY-1) ...
            repmat(ones(1,ImgX+HBH),1,VBH)];
hsync_i  = repmat([zeros(1,HSW) ones(1,ImgX+HFP+HBP)],1,TFL);
hblank_i = [ones(1,HSW+HBP) repmat([zeros(1,ImgX) ones(1,HBH)],1,TFL-1) ...
            zeros(1,ImgX) ones(1,HFP)];
actvid_i = [zeros(1,HSW+HBP) repmat([ones(1,ImgX) zeros(1,HBH)],1,ImgY) ...
            zeros(1,(ImgX+HBH)*(VBH-1)+ImgX+HFP)];
        
else % No_Sim
    
    vsync_i =  0;
    vblank_i = 0;
    hsync_i  = 0;
    hblank_i = 0;
    actvid_i = 0;
 
end % No_Sim

%% Form input data stream using XSVI control signals
if No_Sim == 0
    
    data_i = ones(1,TFL); % default pixel value
    for r=1:ImgY
        idx = (r-1)*(ImgX+HBH) + HSW + HBP + 1; % +1 because of Matlab indexing
        data_i(idx:idx+ImgX-1) = ImgIn(r,:);
    end
    vd_i = data_i*2^16 + data_i*2^8 + data_i; % red + green + blue channel

else % No_Sim
    
    vd_i = 0;

end % No_Sim

%% Configure and Simulate HW-Model
load_system(mdl);
Tsim = 2*TFL+(HBH+ImgX)*(VBH); % simulation length
%get_param(strcat(mdl,mdl_hw,'Cfg_Reg_Pxl_Idx'),'DialogParameters')
set_param(strcat(mdl,mdl_hw,'Cfg_Reg_Pxl_Idx_red'),'init',int2str(r_blank_idx));
set_param(strcat(mdl,mdl_hw,'Cfg_Reg_Pxl_Idx_green'),'init',int2str(g_blank_idx));
set_param(strcat(mdl,mdl_hw,'Cfg_Reg_Pxl_Idx_blue'),'init',int2str(b_blank_idx));
set_param(strcat(mdl,mdl_hw,'Cfg_Reg_Pxl_Val_red'),'init',int2str(r_blank_val));
set_param(strcat(mdl,mdl_hw,'Cfg_Reg_Pxl_Val_green'),'init',int2str(g_blank_val));
set_param(strcat(mdl,mdl_hw,'Cfg_Reg_Pxl_Val_blue'),'init',int2str(b_blank_val));
% start simulation only when required
if No_Sim == 0
    sim(mdl);
end
    
%% Form result image from output stream using XSVI-output signals
if No_Sim == 0
% first falling edge detection on vblank
i1 = min(find([~[vblank_o;1] & [0;vblank_o]]));
% offset to linear pixel index 0 (first pixel in frame)
i1 = i1 + HSW + HBP;
% consistency check with all XSVI output signals
if ~vsync_o(i1) | vblank_o(i1) | ~hsync_o(i1) | hblank_o(i1) | ~active_video_o(i1)
  disp('ERROR: XSVI output signals not consistent!!!');
end;
% form RGB streams
r_stream = zeros(1,Npxl);
g_stream = zeros(1,Npxl);
b_stream = zeros(1,Npxl);
for r = 1:ImgY
    % extract one row of 24-bit data pixels from output video stream
    row_rgb = vd_o(i1:i1+ImgX-1);
    % extract 3 x 8-bit RGB-values from 24-bit data pixels 
    row_b = floor(rem(row_rgb,2^8));
    row_g = floor(rem(row_rgb/2^8,2^8));
    row_r = floor(row_rgb/2^16);
    % add row of RGB-values to corresponding stream
    i2 = (r-1)*ImgX + 1; % +1 because of Matlab i
    b_stream(i2:i2+ImgX-1) = row_b;
    g_stream(i2:i2+ImgX-1) = row_g;
    r_stream(i2:i2+ImgX-1) = row_r;
    % calculate index of next valid pixel in out video stream
    i1 = i1 + ImgX + HBH;
end
% convert RGB streams to 3 output images
r_ImgOut = vec2mat(r_stream,ImgX);
g_ImgOut = vec2mat(g_stream,ImgX);
b_ImgOut = vec2mat(b_stream,ImgX);
end % No_Sim

%% Plot images per color channel for visual comparison of expected and actual outputs
if No_Sim == 0
% input images
subplot(3,3,1); imshow(ImgIn,[0 255]); title('original input image (red)');
subplot(3,3,2); imshow(ImgIn,[0 255]); title('original input image (green)');
subplot(3,3,3); imshow(ImgIn,[0 255]); title('original input image (blue)');
% expected output images
subplot(3,3,4); imshow(r_ImgExp,[0 255]); title('expected output image (red)');
subplot(3,3,5); imshow(g_ImgExp,[0 255]); title('expected output image (green)');
subplot(3,3,6); imshow(b_ImgExp,[0 255]); title('expected output image (blue)');
%actual output images
subplot(3,3,7); imshow(r_ImgOut,[0 255]); title('actual output image (red)');
subplot(3,3,8); imshow(g_ImgOut,[0 255]); title('actual output image (green)');
subplot(3,3,9); imshow(b_ImgOut,[0 255]); title('actual output image (blue)');
end % No_Sim

%% Compare expected and actual outputs and report # of differences
diff_r = num2str(length(find(r_ImgExp-r_ImgOut)));
diff_g = num2str(length(find(g_ImgExp-g_ImgOut)));
diff_b = num2str(length(find(b_ImgExp-b_ImgOut)));
disp(['# of pixel mismatches: R = ' diff_r '  G = ' diff_g '  B = ' diff_b]);
