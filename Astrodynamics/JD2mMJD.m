function mMJD = JD2mMJD(JD)
% JD2mMJD Converts Julian Date (from MATLAB's juliandate() function) to
%   the Modified Julian Date (with an offset at 05 Jan 1941 12:00:00.000)
%   that GMAT uses (A1ModJulian).
%
% Inputs:
%   JD - Julian Date (as output from MATLAB's juliandate() function)
%
% Outputs:
%   mMJD - Modified Julian Date (as used by GMAT's UTCModJulian)
%
% Information:
%   Author: Matthew Mader
%   Contact: matthewjmader@gmail.com
%   Date: 18 Apr. 2022
%
% Revision History:
%   Rev: IR
%   Date: 18 Apr. 2022
%   Notes: Initial release.

% data source:
% http://gmat.sourceforge.net/docs/nightly/html/SpacecraftEpoch.html

% Modified Julian Date offset
offset = 2430000.0;

% conversion
mMJD = JD - offset;

end