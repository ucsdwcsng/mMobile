function [h_out] = cosineInterpolateCIR(h_in,sps)
% Ish Jain 
% ikjain@ucsd.edu
% It takes original CIR, upsamples it and interpolates with a cosine
% filter. The upsampled CIR has many advantages such as
% 1, Getting accurate subsampled ToF for peak
% 2, Getting accurate peak power for CIR

if(nargin<2)
    sps = 8;            % Samples per symbol
end
wannaplot=1;

%---------------------------------------------
N_SC = length(h_in); %number of subcarriers
rolloff = 0.25;     % Rolloff factor
span = 16;           % Filter span in symbols
b = rcosdesign(rolloff, span, sps);
powb = sqrt(mean(abs(b).^2));
b=b/powb;
x = upfirdn(h_in, b, sps);

cutx=ceil((length(b)-sps)/2);

x=x(cutx:end-cutx);
pin = sqrt(mean(abs(h_in).^2));
pout = sqrt(mean(abs(x).^2));
h_out=x*pin/pout; %normalize the power


if(wannaplot)
    figure(243);clf;
    plot(1:length(h_in),db(h_in), 'linewidth',2)
    hold on; grid on;
    plot((1:sps*length(h_in))/sps,db(h_out), 'linewidth',2);
    plot((1:sps*length(h_in))/sps, db(h_out_zeropad), 'linewidth',2)
    legend('h original', 'h cosine interpolated', 'h zeropad method')
    xlabel('time samples')
    ylabel('CIR (dB)')
end

end
