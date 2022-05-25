
% Ish jain
% ikjain@ucsd.edu
% Analyse mMobile data and plot CIR and beam RSS

foldername = "dataset/";
titlelist = {'Indoor 2.5m', 'Indoor 4.16m', 'Outdoor 10m', 'Outdoor 30m'};
matfilelist = ["indoor_2_5m_data", "indoor_4_2m_data", "outdoor_10m_data", "outdoor_30m_data"];
nPointList = [21,32, 31,45];
distance_resolution_list = [.1,.1,.2,.3];
link_length_list = [2.5,4.2,10,30];
orientation_list = [0,0,0,30];
%--------------------------------------

fileidx = 1; %1,2 are indoor and 3,4 are outdoors

matfile=matfilelist(fileidx);
filename = foldername+matfile;
load(filename); %loads 'rssi', 'rx_h_est_vec'

npoints = nPointList(fileidx);
titlename=titlelist{fileidx};

% get angle AoD ground truth from user location
dres=distance_resolution_list(fileidx); %m
orient = orientation_list(fileidx); %degree
d = 0:dres:(npoints-1)*dres;
trxlen = link_length_list(fileidx);
trxangle = atand(d*cosd(orient)/trxlen+d*sind(orient));

loc=1; %user location for plotting
beamidx=1; %beam index for plotting

% interpolate the CIR
channel_vector = squeeze(rx_h_est_vec(loc,beamidx,:));
[rx_h_est_interp] = cosineInterpolateCIR(channel_vector);

% 240kHz subcarrier spacing for 256 subcarriers with 80% subcarriers loaded
% with data
BW = 240000*256*.8; %Hz
time_axis = 0:1/BW:255/BW;
figure(1); clf;
plot(time_axis*1e9,squeeze(db(rx_h_est_vec(loc,beamidx,:))))
grid on;
xlabel('time (ns)')
ylabel('CIR (dB)')
title(sprintf('CIR for user location %d and beam index %d',loc,beamidx))
% saveas(gcf,pwd+"/figures/"+matfile+"_CIR.png")

figure(2);clf;
imagesc(0:30,trxangle,rssi); axis xy
ylabel('User Locations (degree)')
xlabel('Beam angle (degree)')
colorbar;
title(['RSS power (dB)| ', titlename])

% saveas(gcf,pwd+"/figures/"+matfile+"_RSS.png")
