function dt = JD2dt(JD)
% JD2DT converts a Julian Date (from MATLAB's juliandate() function) to
%   a datetime (from MATLAB's datetime() function).
%
% Inputs:
%   JD - Julian Date (as output from MATLAB's juliandate() function)
%
% Outputs:
%   dt - datetime (using formatting F if available)
%
% Information:
%   Author: Matthew Mader
%   Contact: maderm@purdue.edu
%   Date: 18 Apr. 2022
%
% Revision History:
%   Rev: IR
%   Date: 18 Apr. 2022
%   Notes: Initial release.

% get date string from Julian Date
str = JD2date(JD,'dd mmm yyyy HH:MM:SS.FFF');

% convert date string to datetime
dt = datetime(str,'InputFormat','dd MMM yyyy HH:mm:ss.SSS');

end