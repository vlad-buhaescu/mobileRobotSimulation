function varargout = warning_depasire(varargin)
% WARNING_DEPASIRE MATLAB code for warning_depasire.fig
%      WARNING_DEPASIRE, by itself, creates a new WARNING_DEPASIRE or raises the existing
%      singleton*.
%
%      H = WARNING_DEPASIRE returns the handle to a new WARNING_DEPASIRE or the handle to
%      the existing singleton*.
%
%      WARNING_DEPASIRE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WARNING_DEPASIRE.M with the given input arguments.
%
%      WARNING_DEPASIRE('Property','Value',...) creates a new WARNING_DEPASIRE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before warning_depasire_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to warning_depasire_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help warning_depasire

% Last Modified by GUIDE v2.5 30-May-2013 18:50:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @warning_depasire_OpeningFcn, ...
                   'gui_OutputFcn',  @warning_depasire_OutputFcn, ...
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


% --- Executes just before warning_depasire is made visible.
function warning_depasire_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to warning_depasire (see VARARGIN)

% Choose default command line output for warning_depasire
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes warning_depasire wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = warning_depasire_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close