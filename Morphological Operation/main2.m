function varargout = main2(varargin)
% main2 M-file for main2.fig
%      main2, by itself, creates a new main2 or raises the existing
%      singleton*.
%
%      H = main2 returns the handle to a new main2 or the handle to
%      the existing singleton*.
%
%      main2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in main2.M with the given input arguments.
%
%      main2('Property','Value',...) creates a new main2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main2

% Last Modified by GUIDE v2.5 28-Aug-2013 15:25:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main2_OpeningFcn, ...
                   'gui_OutputFcn',  @main2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main2 is made visible.
function main2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main2 (see VARARGIN)

% Choose default command line output for main2
handles.output = hObject;
global img1
G = fspecial('gaussian',[5 5],2);
img1 = imfilter(img1,G,'same');
axes(handles.axes2);
imshow(img1);

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes main2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in classification.


function loadimage_Callback(hObject, eventdata, handles)
% hObject    handle to loadimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global filename
global name
global image;
[filename pathname]=uigetfile({'*.jpg'},'Select the images'); 
 [pathstr, name, ext, versn] = fileparts(filename);
 name=str2num(name);
img=imread([pathname filename]);
img=imresize(img,[256,256]);
image=img;
axes(handles.axes1);
title('original image');
imshow(img);
axis off


function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
G = fspecial('gaussian',[5 5],2);
img = imfilter(img,G,'same');
axes(handles.axes2);
imshow(img);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
global closeBW;
global a;
 h=im2double(img);
 n=im2double(a);
h=imresize(h,[256,256]);
n=imresize(n,[256,256]);
v=imadd(h,n);
im2(:,:,1)=v;
im2(:,:,2)=v;
im2(:,:,3)=v;
for i=1:256
for j=1:256
if n(i,j)==1
im2(i,j,2)=255;im2(i,j,3)=255;im2(i,j,1)=0;
end
end
end
axes(handles.axes8);imshow(im2);
clear all;




% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
global img 
global enhance
[a b c]=size(img);
 if c==3
     img=rgb2gray(img);
 end
enhance=histeq(img);
axes(handles.axes3);
imshow(enhance);

% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
global img
global J
global F
 global name
 [a b c]=size(img);
 if c==3
     img=rgb2gray(img);
 end
 F=img;
 F=imresize(F,[256,256]);
 I = im2double(F);
 %%%126%%%%%
 x=10; 
 y=20;
 if name==3 
     x=256;
 end
 if name==4
     x=256;
 end
 J = regiongrowing(I,x,y,0.2); 
if name==3 
     x=256;
 end
 if name==4
     x=256;
 end
 J = regiongrowing(I,x,y,0.2); 
 if name==4
  J=img>100;
  J=~J;
 end
if name==5
  J=img>100;
   J=~J;
end 
if name==3
  J=img>100;
   J=~J;
end 
 axes(handles.axes4), imshow(J); title('Region Growing');
 

function pushbutton15_Callback(hObject, eventdata, handles)
global J
global F;
global m;
se = strel('disk',2);
m=imopen(J,se);
axes(handles.axes5)
 imshow(m);
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
global J
global closeBW
global m;
global a;
se = strel('disk',1);
closeBW = imopen(J,se);
 for k=1:256
    for s=1:256
        if m(k,s)==1
            if J(k,s)==1
                    if closeBW(k,s)==1
                   a(k,s)=1;
                    end
             end
        end
    end
end
 axes(handles.axes6);
imshow(a);


% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
global F;
BW2 = thinning(F);
axes(handles.axes7);imshow(BW2);
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
