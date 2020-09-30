function [fitresult, gof] = createFit(CycleNo, ActualSOH)
%CREATEFIT(CYCLENO,ACTUALSOH)
%  Create a fit.
% code applicable for LFP type batteries only
% Constant temperature of 300K is assumed
% final expression for SoH prediction = y = - 0.44*z^{9} - 0.24*z^{8} + 2.5*z^{7} + 0.86*z^{6} - 4.7*z^{5} - 0.87*z^{4} + 3.2*z^{3} + 0.65*z^{2} - 7*z + 90
% where z = (x - 1.2e+03)/6.7e+02, where x is the number of cycles elapsed
%  Data for 'untitled fit 1' fit:
%      X Input : CycleNo
%      Y Output: ActualSOH
%      Weights : ActualSOH
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.



%% Fit: 'untitled fit 1'.
[xData, yData, weights] = prepareCurveData( CycleNo, ActualSOH, ActualSOH );

% Set up fittype and options.
ft = fittype( 'poly9' );
opts = fitoptions( ft );
opts.Lower = [-Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf];
opts.Upper = [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];
opts.Weights = weights;
opts.Normalize = 'on';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'ActualSOH vs. CycleNo with ActualSOH', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel( 'CycleNo' );
ylabel( 'ActualSOH' );
grid on


