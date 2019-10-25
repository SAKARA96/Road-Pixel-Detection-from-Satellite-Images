function varargout = main8(varargin)
% main8 M-file for main8.fig
%      main8, by itself, creates a new main8 or raises the existing
%      singleton*.
%
%      H = main8 returns the handle to a new main8 or the handle to
%      the existing singleton*.
%
%      main8('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in main8.M with the given input arguments.
%
%      main8('Property','Value',...) creates a new main8 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main8_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main8_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main8

% Last Modified by GUIDE v2.5 28-Aug-2013 17:11:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main8_OpeningFcn, ...
                   'gui_OutputFcn',  @main8_OutputFcn, ...
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


% --- Executes just before main8 is made visible.
function main8_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main8 (see VARARGIN)

% Choose default command line output for main8

% handles.output = hObject;
global image;
global closeBW;
global J h n v im2;
[m ,n ,c]=size(image);
if c==3
  image=rgb2gray(image);
end
 h=im2double(image);
 n=im2double(J);
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
axes(handles.axes2);imshow(im2);
% clear all;

% Update handles structure
% guidata(hObject, handles);



% UIWAIT makes main8 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main8_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% varargout{1} = handles.output;
% --- Executes on button press in classification.
