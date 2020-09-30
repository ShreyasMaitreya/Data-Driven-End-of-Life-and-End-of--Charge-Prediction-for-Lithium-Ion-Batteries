function [fitresult, gof] = createFit(CycleNo, ActualSOH)
%CREATEFIT(CYCLENO,ACTUALSOH)
%  Create a fit.
%
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


