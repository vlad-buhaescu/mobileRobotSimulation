function varargout = at_least_2points(varargin)
% AT_LEAST_2POINTS MATLAB code for at_least_2points.fig
%      AT_LEAST_2POINTS, by itself, creates a new AT_LEAST_2POINTS or raises the existing
%      singleton*.
%
%      H = AT_LEAST_2POINTS returns the handle to a new AT_LEAST_2POINTS or the handle to
%      the existing singleton*.
%
%      AT_LEAST_2POINTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AT_LEAST_2POINTS.M with the given input arguments.
%
%      AT_LEAST_2POINTS('Property','Value',...) creates a new AT_LEAST_2POINTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before at_least_2points_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to at_least_2points_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help at_least_2points

% Last Modified by GUIDE v2.5 29-Mar-2013 00:12:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @at_least_2points_OpeningFcn, ...
                   'gui_OutputFcn',  @at_least_2points_OutputFcn, ...
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


% --- Executes just before at_least_2points is made visible.
function at_least_2points_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to at_least_2points (see VARARGIN)

% Choose default command line output for at_least_2points
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes at_least_2points wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = at_least_2points_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
