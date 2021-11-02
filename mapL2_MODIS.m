% Code written by Sarah Lang, slang@uri.edu. University of Rhode Island's Graduate School of Oceanography.
% November 1, 2021

%% Read data
cd '/Users/sarahlang/Desktop/mapL2/';

% Add functions to path
addpath('/Users/sarahlang/Desktop/mapL2/functions')
addpath('/Users/sarahlang/Desktop/mapL2/functions/m_map')

% Loop Through Directory and Write Coordinates to a Structure
sdir = dir('/Users/sarahlang/Desktop/mapL2/data/*OC');
spath = '/Users/sarahlang/Desktop/mapL2/data/';

% Note: If processing data from a different satellite, check
% parameters using ncdisp('<filename>'). I think they should all be the
% same, but if you get an error about a missing variable, this may be why.
%% Loop through directory, map parameter of interest
for file = 1:length(sdir)
    
    cd(spath)
    
    % Read Files
    filename = sdir(file).name;
    
    chlora=ncread(filename,'/geophysical_data/chlor_a');
%   pic=ncread(filename,'pic');
%   poc=ncread(filename,'poc');
    lat=ncread(filename,'/navigation_data/latitude');
    lon=ncread(filename,'/navigation_data/longitude');

    % Subset data
    latmatches = (lat >= 38 & lat <= 40); %define bounds of latitude
    longmatches = (lon >= -125 & lon <= -123); %define bounds of longitude
    subset = (longmatches==1 & latmatches==1); %create logical array for subsetting
    chl=chlora.*subset;
    chl(chl==0)= NaN;
    longitude=lon.*subset;
    lon(lon==0)= NaN;
    latitude=lat.*subset;
    lat(lat==0)= NaN;
    
 
    LATLIMS=[38 40]; %change as above
    LONLIMS=[-125 -123];
    
    %get date for plot titles
    julianday = filename(6:8);
    t=datestr(datenum(2021,0, str2num(julianday)));
    
    figure()
    m_proj('Mercator','lon',LONLIMS,'lat',LATLIMS);
    m_pcolor(lon, lat, chl);shading flat;
    m_grid('linewi',2,'tickdir','out');
    h=colorbar;
    m_coast('linewidth',0.5,'color','k');
    set(get(h,'ylabel'),'String','Chlorophyll-a (mg/m^{3})');
    caxis([0 1]) %change to reflect what chlorophyll concs you are working with
    ylabel('Latitude ( Â°)')
    xlabel('Longitude ( Â°)')
    title([t])
    set(gca,'FontSize',14);  
    print(gcf,[t,'_chl.pdf'],'-dpdf','-r300'); 
end
